import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class NgoAuthScreen extends StatefulWidget {
  const NgoAuthScreen({super.key});

  @override
  _NgoAuthScreenState createState() => _NgoAuthScreenState();
}

class _NgoAuthScreenState extends State<NgoAuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final _officialIdController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isLogin 
            ? AppLocalizations.of(context).officialLogin 
            : AppLocalizations.of(context).officialSignup),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              if (!_isLogin) ...[
                Text(
                  AppLocalizations.of(context).officialIdNote,
                  style: TextStyle(
                    color: Colors.blue[700],
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 16),
              ],
              TextFormField(
                controller: _officialIdController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context).officialId,
                  prefixIcon: const Icon(Icons.badge),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context).officialIdRequired;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context).password,
                  prefixIcon: const Icon(Icons.lock),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context).passwordRequired;
                  }
                  if (value.length < 6) {
                    return AppLocalizations.of(context).passwordLength;
                  }
                  return null;
                },
              ),
              if (!_isLogin) ...[
                const SizedBox(height: 16),
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).confirmPassword,
                    prefixIcon: const Icon(Icons.lock_outline),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context).confirmPasswordRequired;
                    }
                    if (value != _passwordController.text) {
                      return AppLocalizations.of(context).passwordsDontMatch;
                    }
                    return null;
                  },
                ),
              ],
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacementNamed(context, '/ngo-dashboard');
                  }
                },
                child: Text(_isLogin 
                    ? AppLocalizations.of(context).login 
                    : AppLocalizations.of(context).signup),
              ),
              const SizedBox(height: 24),
              TextButton(
                onPressed: () {
                  setState(() {
                    _isLogin = !_isLogin;
                  });
                },
                child: Text(_isLogin
                    ? AppLocalizations.of(context).createOfficialAccount
                    : AppLocalizations.of(context).alreadyHaveOfficialAccount),
              ),
            ],
          ),
        ),
      ),
    );
  }
}