import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';
import 'screens/dashboard_screen.dart';
import 'screens/citizen_auth_screen.dart';
import 'screens/citizen_dashboard.dart';
import 'screens/ngo_auth_screen.dart'; // Add this import
import 'screens/ngo_dashboard.dart'; // Add this import


void main() {
  runApp(const EcoWatchApp());
}

class EcoWatchApp extends StatelessWidget {
  const EcoWatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eco Watch',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Changed to blue for govt theme
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardScreen(),
        '/citizen-auth': (context) => const CitizenAuthScreen(),
        '/citizen-dashboard': (context) => const CitizenDashboard(),
        '/ngo-auth': (context) => const NgoAuthScreen(), // Add this route
        '/ngo-dashboard': (context) => const NgoDashboard(), // Add this route
      },
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('hi', 'IN'),
        Locale('es', 'ES'),
        Locale('fr', 'FR'),
      ],
    );
  }
}