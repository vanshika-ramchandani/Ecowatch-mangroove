import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart'; // Fixed import

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).appTitle), // Fixed: removed !
        actions: [
          IconButton(
            icon: const Icon(Icons.translate),
            onPressed: () {
              // TODO: Implement language selection
            },
          ),
          IconButton(
            icon: const Icon(Icons.volume_up),
            onPressed: () {
              // TODO: Implement text-to-speech
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.eco,
              size: 100,
              color: Colors.green,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/citizen-auth');
              },
              child: Text(AppLocalizations.of(context).coastalPeople), // Fixed
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ngo-auth');
              },
              child: Text(AppLocalizations.of(context).ngosGovernment), // Fixed
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
              },
              child: Text(AppLocalizations.of(context).researchersStudents), // Fixed
            ),
          ],
        ),
      ),
    );
  }
}