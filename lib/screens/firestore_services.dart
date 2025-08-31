import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Get current user
  User? get currentUser => _auth.currentUser;

  // Get user data stream
  Stream<DocumentSnapshot> getUserStream() {
    User? user = _auth.currentUser;
    if (user != null) {
      return _firestore
          .collection('users')
          .doc(user.uid)
          .snapshots();
    }
    return const Stream.empty();
  }

  // Get dashboard statistics
  Future<Map<String, dynamic>> getDashboardStats() async {
    User? user = _auth.currentUser;
    if (user != null) {
      try {
        // Get user document
        DocumentSnapshot userDoc = await _firestore
            .collection('users')
            .doc(user.uid)
            .get();

        // Get complaints count
        QuerySnapshot complaintsSnapshot = await _firestore
            .collection('complaints')
            .where('userId', isEqualTo: user.uid)
            .get();

        int total = complaintsSnapshot.docs.length;
        int verified = complaintsSnapshot.docs
            .where((doc) => doc['status'] == 'verified')
            .length;
        int pending = complaintsSnapshot.docs
            .where((doc) => doc['status'] == 'pending')
            .length;

        Map<String, dynamic> userData = userDoc.exists 
            ? userDoc.data() as Map<String, dynamic> 
            : {};

        return {
          'totalComplaints': total,
          'verifiedComplaints': verified,
          'pendingComplaints': pending,
          'treesPlanted': userData['treesPlanted'] ?? 0,
          'badgeProgress': userData['badgeProgress'] ?? 0,
          'badgeTarget': userData['badgeTarget'] ?? 5,
          'currentBadge': userData['currentBadge'] ?? 'Bronze',
        };
      } catch (e) {
        print('Error getting dashboard stats: $e');
      }
    }
    return {
      'totalComplaints': 0,
      'verifiedComplaints': 0,
      'pendingComplaints': 0,
      'treesPlanted': 0,
      'badgeProgress': 0,
      'badgeTarget': 5,
      'currentBadge': 'Bronze',
    };
  }

  // Submit a new complaint
  Future<void> submitComplaint({
    required String description,
    required String issueType,
    required Position location,
    String? imagePath,
  }) async {
    User? user = _auth.currentUser;
    if (user != null) {
      try {
        // Create complaint document
        await _firestore.collection('complaints').add({
          'userId': user.uid,
          'description': description,
          'issueType': issueType,
          'location': {
            'latitude': location.latitude,
            'longitude': location.longitude,
          },
          'imageUrl': imagePath,
          'status': 'pending',
          'createdAt': FieldValue.serverTimestamp(),
          'updatedAt': FieldValue.serverTimestamp(),
        });

        // Update user's badge progress
        await _firestore.collection('users').doc(user.uid).set({
          'badgeProgress': FieldValue.increment(1),
          'lastUpdated': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true));

      } catch (e) {
        print('Error submitting complaint: $e');
        throw e;
      }
    }
  }

  // Get user location
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied');
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  // Get user profile data
  Future<Map<String, dynamic>?> getUserProfile() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await _firestore
          .collection('users')
          .doc(user.uid)
          .get();
      
      if (userDoc.exists) {
        return userDoc.data() as Map<String, dynamic>;
      }
    }
    return null;
  }
}