import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class NgoDashboard extends StatefulWidget {
  const NgoDashboard({super.key});

  @override
  _NgoDashboardState createState() => _NgoDashboardState();
}

class _NgoDashboardState extends State<NgoDashboard> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const ComplaintsScreen(),
    const MapScreen(),
    const AnalyticsScreen(),
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
        title: Text(AppLocalizations.of(context)?.ngoDashboard ?? 'NGO Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              _showFilterDialog(context);
            },
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.list),
            label: AppLocalizations.of(context)?.complaints ?? 'Complaints',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.map),
            label: AppLocalizations.of(context)?.map ?? 'Map',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.analytics),
            label: AppLocalizations.of(context)?.analytics ?? 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: AppLocalizations.of(context)?.profile ?? 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const FilterDialog();
      },
    );
  }
}

// Complaints Screen
class ComplaintsScreen extends StatelessWidget {
  const ComplaintsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample complaints data
    final complaints = [
      {
        'id': '#12345',
        'date': '2023-10-15',
        'type': 'Illegal Cutting',
        'status': 'Pending',
        'severity': 'High',
        'location': 'Coastal Area A',
        'description': 'Large-scale mangrove cutting observed',
      },
      {
        'id': '#12346',
        'date': '2023-10-14',
        'type': 'Dumping',
        'status': 'Verified',
        'severity': 'Medium',
        'location': 'Coastal Area B',
        'description': 'Industrial waste dumping in mangrove area',
      },
      {
        'id': '#12347',
        'date': '2023-10-13',
        'type': 'Pollution',
        'status': 'Resolved',
        'severity': 'Low',
        'location': 'Coastal Area C',
        'description': 'Oil spill detected in northern mangrove zone',
      },
    ];

    return ListView.builder(
      itemCount: complaints.length,
      itemBuilder: (context, index) {
        final complaint = complaints[index];
        return ComplaintCard(complaint: complaint);
      },
    );
  }
}

// Complaint Card Widget
class ComplaintCard extends StatelessWidget {
  final Map<String, dynamic> complaint;

  const ComplaintCard({super.key, required this.complaint});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          color: Colors.grey[200],
          child: const Icon(Icons.photo, size: 30),
        ),
        title: Text(complaint['type']!),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID: ${complaint['id']!} • ${complaint['date']!}'),
            Text('Location: ${complaint['location']!}'),
            Text('Severity: ${complaint['severity']!}'),
          ],
        ),
        trailing: Chip(
          label: Text(
            complaint['status']!,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: _getStatusColor(complaint['status']!),
        ),
        onTap: () {
          _showComplaintDetails(context, complaint);
        },
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Pending': return Colors.orange;
      case 'Verified': return Colors.blue;
      case 'Resolved': return Colors.green;
      default: return Colors.grey;
    }
  }

  void _showComplaintDetails(BuildContext context, Map<String, dynamic> complaint) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ComplaintDetailsDialog(complaint: complaint);
      },
    );
  }
}

// Map Screen with Hotspot Visualization
class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            AppLocalizations.of(context)?.hotspotMap ?? 'Hotspot Map',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              // Placeholder for map
              Container(
                color: Colors.grey[200],
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.map, size: 50, color: Colors.blue),
                      const SizedBox(height: 16),
                      Text(
                        AppLocalizations.of(context)?.redZones ?? 'Red Zones',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      const Text('Interactive heat map showing complaint density'),
                    ],
                  ),
                ),
              ),
              // Hotspot overlay indicators
              Positioned(
                top: 100,
                left: 50,
                child: _buildHotspot(Colors.red, 'High Density'),
              ),
              Positioned(
                top: 200,
                right: 70,
                child: _buildHotspot(Colors.orange, 'Medium'),
              ),
              Positioned(
                bottom: 150,
                left: 120,
                child: _buildHotspot(Colors.yellow, 'Low'),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildLegendItem(Colors.red, 'High Priority'),
              _buildLegendItem(Colors.orange, 'Medium Priority'),
              _buildLegendItem(Colors.yellow, 'Low Priority'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHotspot(Color color, String label) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color.withOpacity(0.6),
            shape: BoxShape.circle,
            border: Border.all(color: color, width: 2),
          ),
        ),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildLegendItem(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          color: color,
        ),
        const SizedBox(width: 8),
        Text(text),
      ],
    );
  }
}

// Analytics Screen
class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)?.complaintTrends ?? 'Complaint Trends',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 20),
          
          // Statistics Cards
          Row(
            children: [
              _buildStatCard('Total Complaints', '142', Colors.blue),
              _buildStatCard('Resolved', '89', Colors.green),
              _buildStatCard('Pending', '53', Colors.orange),
            ],
          ),
          const SizedBox(height: 20),
          
          // Chart Placeholder
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.bar_chart, size: 40, color: Colors.blue),
                  const SizedBox(height: 8),
                  Text(AppLocalizations.of(context)?.complaintTrends ?? 'Complaint Trends'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          
          // Export Button
          ElevatedButton.icon(
            onPressed: () {
            },
            icon: const Icon(Icons.download),
            label: Text(AppLocalizations.of(context)?.exportData ?? 'Export Data'),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Profile Screen with Badges & Credits
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundColor: Colors.blue,
            child: Icon(Icons.account_balance, size: 40, color: Colors.white),
          ),
          const SizedBox(height: 16),
          Text(
            'Forest Department',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Text(
            'ID: GOV123456',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),
          
          // Credits Card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    AppLocalizations.of(context)?.creditsEarned ?? 'Credits Earned',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '1,250',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[700],
                    ),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                    },
                    child: Text(AppLocalizations.of(context)?.funding ?? 'Funding'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          
          // Badges Section
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    AppLocalizations.of(context)?.badges ?? 'Badges',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildBadge(Icons.emoji_events, 'Gold', Colors.amber),
                      _buildBadge(Icons.emoji_events, 'Silver', Colors.grey),
                      _buildBadge(Icons.emoji_events, 'Bronze', Colors.brown),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(IconData icon, String label, Color color) {
    return Column(
      children: [
        Icon(icon, size: 40, color: color),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}

// Filter Dialog
class FilterDialog extends StatefulWidget {
  const FilterDialog({super.key});

  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  String? _selectedStatus;
  String? _selectedSeverity;
  String? _selectedType;
  String? _selectedLocation;

  final List<String> _statusOptions = ['Pending', 'Verified', 'Resolved'];
  final List<String> _severityOptions = ['Low', 'Medium', 'High'];
  final List<String> _typeOptions = ['Illegal Cutting', 'Dumping', 'Pollution', 'Other'];
  final List<String> _locationOptions = ['Coastal Area A', 'Coastal Area B', 'Coastal Area C'];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppLocalizations.of(context)?.filter ?? 'Filter',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            
            // Status Filter
            DropdownButtonFormField<String>(
              value: _selectedStatus,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)?.status ?? 'Status',
              ),
              items: _statusOptions.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedStatus = newValue;
                });
              },
            ),
            const SizedBox(height: 16),
            
            // Severity Filter
            DropdownButtonFormField<String>(
              value: _selectedSeverity,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)?.severity ?? 'Severity',
              ),
              items: _severityOptions.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedSeverity = newValue;
                });
              },
            ),
            const SizedBox(height: 16),
            
            // Type Filter
            DropdownButtonFormField<String>(
              value: _selectedType,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)?.type ?? 'Type',
              ),
              items: _typeOptions.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedType = newValue;
              });
              },
            ),
            const SizedBox(height: 16),
            
            // Location Filter
            DropdownButtonFormField<String>(
              value: _selectedLocation,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)?.location ?? 'Location',
              ),
              items: _locationOptions.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedLocation = newValue;
                });
              },
            ),
            const SizedBox(height: 24),
            
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        _selectedStatus = null;
                        _selectedSeverity = null;
                        _selectedType = null;
                        _selectedLocation = null;
                      });
                    },
                    child: Text(AppLocalizations.of(context)?.clearAll ?? 'Clear All'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(AppLocalizations.of(context)?.applyFilters ?? 'Apply Filters'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Complaint Details Dialog
class ComplaintDetailsDialog extends StatefulWidget {
  final Map<String, dynamic> complaint;

  const ComplaintDetailsDialog({super.key, required this.complaint});

  @override
  _ComplaintDetailsDialogState createState() => _ComplaintDetailsDialogState();
}

class _ComplaintDetailsDialogState extends State<ComplaintDetailsDialog> {
  final _notesController = TextEditingController();
  String? _selectedStatus;

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
              'Complaint Details',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            
            Container(
              height: 150,
              color: Colors.grey[200],
              child: const Icon(Icons.photo, size: 50),
            ),
            const SizedBox(height: 16),
            
            Text('Type: ${widget.complaint['type']!}'),
            Text('Severity: ${widget.complaint['severity']!}'),
            Text('Location: ${widget.complaint['location']!}'),
            Text('Date: ${widget.complaint['date']!}'),
            const SizedBox(height: 16),
            
            Text('Description: ${widget.complaint['description']!}'),
            const SizedBox(height: 16),
            
            // Status Update
            DropdownButtonFormField<String>(
              value: _selectedStatus ?? widget.complaint['status'],
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)?.updateStatus ?? 'Update Status',
              ),
              items: ['Pending', 'Verified', 'Resolved'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedStatus = newValue;
                });
              },
            ),
            const SizedBox(height: 16),
            
            // Notes
            TextFormField(
              controller: _notesController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)?.addNotes ?? 'Add Notes',
                border: const OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 24),
            
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Save Changes'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}