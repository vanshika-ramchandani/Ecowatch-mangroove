import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class CitizenDashboard extends StatefulWidget {
  const CitizenDashboard({super.key});

  @override
  _CitizenDashboardState createState() => _CitizenDashboardState();
}

class _CitizenDashboardState extends State<CitizenDashboard> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const ComplaintScreen(),
    const HistoryScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).citizenDashboard),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
            },
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      floatingActionButton: _selectedIndex == 0 
          ? FloatingActionButton(
              onPressed: () {
                _showComplaintDialog(context);
              },
              tooltip: AppLocalizations.of(context).raiseComplaint,
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: AppLocalizations.of(context).home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.history),
            label: AppLocalizations.of(context).history,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: AppLocalizations.of(context).profile,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _showComplaintDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ComplaintDialog();
      },
    );
  }
}

class ComplaintScreen extends StatelessWidget {
  const ComplaintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context).welcome,
            style: Theme.of(context).textTheme.headlineSmall, // Changed from headline5
          ),
          const SizedBox(height: 8),
          Text(
            AppLocalizations.of(context).dashboardSummary,
            style: Theme.of(context).textTheme.bodyMedium, // Changed from bodyText2
          ),
          const SizedBox(height: 24),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context).yourBadge,
                        style: Theme.of(context).textTheme.titleMedium, // Changed from subtitle1
                      ),
                      const Icon(Icons.emoji_events, color: Colors.amber),
                    ],
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: 0.4,
                    backgroundColor: Colors.grey.shade300,
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '2 of 5 for Bronze',
                    style: Theme.of(context).textTheme.bodySmall, // Changed from caption
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            children: [
              _buildDashboardItem(
                context,
                Icons.report_problem,
                AppLocalizations.of(context).totalComplaints,
                '12',
                Colors.redAccent,
              ),
              _buildDashboardItem(
                context,
                Icons.verified,
                AppLocalizations.of(context).verifiedComplaints,
                '8',
                Colors.green,
              ),
              _buildDashboardItem(
                context,
                Icons.pending_actions,
                AppLocalizations.of(context).pendingComplaints,
                '3',
                Colors.orange,
              ),
              _buildDashboardItem(
                context,
                Icons.forest,
                AppLocalizations.of(context).treesPlanted,
                '5',
                Colors.lightGreen,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardItem(BuildContext context, IconData icon, String title, String value, Color color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 8),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineSmall, // Changed from headline6
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall, // Changed from caption
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final complaints = [
      {
        'id': '#12345',
        'date': '2023-10-15',
        'type': 'Illegal Cutting',
        'status': 'Verified',
        'statusColor': Colors.green,
      },
      {
        'id': '#12346',
        'date': '2023-10-10',
        'type': 'Dumping',
        'status': 'Pending',
        'statusColor': Colors.orange,
      },
      {
        'id': '#12347',
        'date': '2023-10-05',
        'type': 'Pollution',
        'status': 'Resolved',
        'statusColor': Colors.blue,
      },
    ];

    return ListView.builder(
      itemCount: complaints.length,
      itemBuilder: (context, index) {
        final complaint = complaints[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            leading: const Icon(Icons.report_problem),
            title: Text((complaint['type'] as String?) ?? 'Unknown'), // Explicit cast
            subtitle: Text('ID: ${complaint['id'] as String} • ${complaint['date'] as String}'),
            trailing: Chip(
              label: Text(
                (complaint['status'] as String?) ?? 'Unknown', // Explicit cast
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: complaint['statusColor'] as Color,
            ),
            onTap: () {
            },
          ),
        );
      },
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const user = {
      'name': 'John Doe',
      'email': 'john.doe@example.com',
      'location': 'Mumbai, India',
      'contact': '+91 9876543210',
      'badge': 'Bronze',
    };

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.green.shade100,
            child: const Icon(
              Icons.person,
              size: 50,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            user['name']!,
            style: Theme.of(context).textTheme.headlineSmall, // Changed from headline6
          ),
          Text(
            user['email']!,
            style: Theme.of(context).textTheme.bodyMedium, // Changed from bodyText2
          ),
          const SizedBox(height: 24),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.location_on),
                    title: const Text('Location'),
                    subtitle: Text(user['location']!),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.phone),
                    title: const Text('Contact'),
                    subtitle: Text(user['contact']!),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.emoji_events),
                    title: const Text('Current Badge'),
                    subtitle: Text(user['badge']!),
                    trailing: Icon(
                      Icons.verified,
                      color: Colors.green.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
            },
            icon: const Icon(Icons.forest),
            label: const Text('Upload Tree Planting Proof'),
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/dashboard');
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}

class ComplaintDialog extends StatefulWidget {
  @override
  _ComplaintDialogState createState() => _ComplaintDialogState();
}

class _ComplaintDialogState extends State<ComplaintDialog> {
  String? _selectedIssueType;
  final _descriptionController = TextEditingController();
  String? _imagePath;

  final List<String> _issueTypes = [
    'Illegal Cutting',
    'Dumping',
    'Pollution',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppLocalizations.of(context).raiseComplaint,
              style: Theme.of(context).textTheme.headlineSmall, // Changed from headline6
            ),
            const SizedBox(height: 16),
            if (_imagePath == null)
              GestureDetector(
                onTap: _showImageSourceDialog,
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    size: 50,
                    color: Colors.grey,
                  ),
                ),
              )
            else
              Stack(
                children: [
                  Image.network(
                    _imagePath!,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.black54,
                      child: IconButton(
                        icon: const Icon(Icons.close, size: 14),
                        onPressed: () {
                          setState(() {
                            _imagePath = null;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedIssueType,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context).issueType,
                border: const OutlineInputBorder(),
              ),
              items: _issueTypes
                  .map((type) => DropdownMenuItem<String>(
                        value: type,
                        child: Text(type),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedIssueType = value;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context).issueTypeRequired;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context).description,
                border: const OutlineInputBorder(),
              ),
              maxLines: 3,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context).descriptionRequired;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.location_on, size: 16),
                const SizedBox(width: 4),
                Text(
                  AppLocalizations.of(context).locationTagging,
                  style: Theme.of(context).textTheme.bodySmall, // Changed from caption
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(AppLocalizations.of(context).cancel),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(AppLocalizations.of(context).complaintSubmitted),
                        ),
                      );
                    },
                    child: Text(AppLocalizations.of(context).submit),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showImageSourceDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context).chooseImageSource),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _getImageFromCamera();
              },
              child: Text(AppLocalizations.of(context).camera),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _getImageFromGallery();
              },
              child: Text(AppLocalizations.of(context).gallery),
            ),
          ],
        );
      },
    );
  }

  void _getImageFromCamera() async {
    setState(() {
      _imagePath = null;
    });
  }

  void _getImageFromGallery() async {
    setState(() {
      _imagePath = null;
    });
  }
}