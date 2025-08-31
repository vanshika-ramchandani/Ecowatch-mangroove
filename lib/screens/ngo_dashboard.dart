import 'package:flutter/material.dart';

void main() {
  runApp(const NGODashboardApp());
}

class NGODashboardApp extends StatelessWidget {
  const NGODashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'Mangrove Protection Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,   
            color: Colors.black54,
          ),
        ),
      ),
      home: const NGODashboard(),
    );
  }
}

class Report {
  final String id;
  final String type;
  final DateTime date;
  final String location;
  final String severity;
  String status;
  final String description;

  Report({
    required this.id,
    required this.type,
    required this.date,
    required this.location,
    required this.severity,
    required this.status,
    required this.description,
  });
}

class NGODashboard extends StatefulWidget {
  const NGODashboard({super.key});

  @override
  State<NGODashboard> createState() => _NGODashboardState();
}

class _NGODashboardState extends State<NGODashboard> {
  List<Report> allReports = [
    Report(
      id: '#12345',
      type: 'Illegal Cutting',
      date: DateTime(2023, 10, 15),
      location: 'Coastal Area A',
      severity: 'High',
      status: 'Reported',
      description: 'Large-scale illegal mangrove cutting observed',
    ),
    Report(
      id: '#12346',
      type: 'Dumping',
      date: DateTime(2023, 10, 14),
      location: 'Coastal Area B',
      severity: 'Medium',
      status: 'Reported',
      description: 'Waste dumping in mangrove area',
    ),
    Report(
      id: '#12347',
      type: 'Pollution',
      date: DateTime(2023, 10, 13),
      location: 'Coastal Area C',
      severity: 'Low',
      status: 'Reported',
      description: 'Oil spill detected in mangrove waters',
    ),
  ];

  void _updateStatus(String id, String newStatus) {
    setState(() {
      for (var report in allReports) {
        if (report.id == id) {
          report.status = newStatus;
          break;
        }
      }
    });
  }

  void _showStatusDialog(Report report) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String? selectedStatus = report.status;
        
        return AlertDialog(
          title: Text('Update Status for ${report.id}'),
          content: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Type: ${report.type}'),
                Text('Location: ${report.location}'),
                const SizedBox(height: 16),
                const Text('Select new status:'),
                const SizedBox(height: 8),
                DropdownButton<String>(
                  value: selectedStatus,
                  onChanged: (String? newValue) {
                    selectedStatus = newValue;
                  },
                  items: <String>['Reported', 'Pending', 'Verified', 'Resolved']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (selectedStatus != null) {
                  _updateStatus(report.id, selectedStatus!);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildReportCard(Report report) {
    Color severityColor;
    switch (report.severity) {
      case 'High':
        severityColor = Colors.red;
        break;
      case 'Medium':
        severityColor = Colors.orange;
        break;
      case 'Low':
        severityColor = Colors.green;
        break;
      default:
        severityColor = Colors.grey;
    }

    Color statusColor;
    switch (report.status) {
      case 'Reported':
        statusColor = Colors.blue;
        break;
      case 'Pending':
        statusColor = Colors.orange;
        break;
      case 'Verified':
        statusColor = Colors.purple;
        break;
      case 'Resolved':
        statusColor = Colors.green;
        break;
      default:
        statusColor = Colors.grey;
    }

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 3,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  report.type,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: statusColor),
                  ),
                  child: Text(
                    report.status,
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text('ID: ${report.id} - ${report.date.year}-${report.date.month.toString().padLeft(2, '0')}-${report.date.day.toString().padLeft(2, '0')}'),
            const SizedBox(height: 4),
            Text('Location: ${report.location}'),
            const SizedBox(height: 4),
            Row(
              children: [
                const Text('Severity: '),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: severityColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: severityColor),
                  ),
                  child: Text(
                    report.severity,
                    style: TextStyle(
                      color: severityColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              report.description,
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.edit, color: Colors.blue),
          onPressed: () => _showStatusDialog(report),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Filter reports by status
    final reportedReports = allReports.where((report) => report.status == 'Reported').toList();
    final pendingReports = allReports.where((report) => report.status == 'Pending').toList();
    final verifiedReports = allReports.where((report) => report.status == 'Verified').toList();
    final resolvedReports = allReports.where((report) => report.status == 'Resolved').toList();

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Mangrove Protection Dashboard'),
          centerTitle: true,
          backgroundColor: const Color(0xFF2E7D32),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'All Reports'),
              Tab(text: 'Pending'),
              Tab(text: 'Verified'),
              Tab(text: 'Resolved'),
            ],
            indicatorColor: Colors.white,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: TabBarView(
          children: [
            // All Reports Tab
            ListView.builder(
              itemCount: allReports.length,
              itemBuilder: (context, index) {
                return _buildReportCard(allReports[index]);
              },
            ),
            
            // Pending Tab
            pendingReports.isEmpty
                ? const Center(child: Text('No pending reports'))
                : ListView.builder(
                    itemCount: pendingReports.length,
                    itemBuilder: (context, index) {
                      return _buildReportCard(pendingReports[index]);
                    },
                  ),
            
            // Verified Tab
            verifiedReports.isEmpty
                ? const Center(child: Text('No verified reports'))
                : ListView.builder(
                    itemCount: verifiedReports.length,
                    itemBuilder: (context, index) {
                      return _buildReportCard(verifiedReports[index]);
                    },
                  ),
            
            // Resolved Tab
            resolvedReports.isEmpty
                ? const Center(child: Text('No resolved reports'))
                : ListView.builder(
                    itemCount: resolvedReports.length,
                    itemBuilder: (context, index) {
                      return _buildReportCard(resolvedReports[index]);
                    },
                  ),
          ],
        ),
      ),
    );
  }
}