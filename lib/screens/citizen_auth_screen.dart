import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart'; // Correct import

class CitizenAuthScreen extends StatefulWidget {
  const CitizenAuthScreen({super.key});

  @override
  _CitizenAuthScreenState createState() => _CitizenAuthScreenState();
}

class _CitizenAuthScreenState extends State<CitizenAuthScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isLogin = true;
  bool _loginWithOtp = false;

  // Form controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isLogin 
            ? AppLocalizations.of(context).login // Fixed: removed !
            : AppLocalizations.of(context).signup), // Fixed: removed !
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              if (!_isLogin) ...[
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).fullName, // Fixed
                    prefixIcon: const Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context).nameRequired; // Fixed
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
              ],
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context).email, // Fixed
                  prefixIcon: const Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context).emailRequired; // Fixed
                  }
                  if (!value.contains('@')) {
                    return AppLocalizations.of(context).validEmailRequired; // Fixed
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              if (_isLogin && !_loginWithOtp) ...[
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).password, // Fixed
                    prefixIcon: const Icon(Icons.lock),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context).passwordRequired; // Fixed
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                    },
                    child: Text(AppLocalizations.of(context).forgotPassword), // Fixed
                  ),
                ),
              ],
              if (!_isLogin) ...[
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).setPassword, // Fixed
                    prefixIcon: const Icon(Icons.lock),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context).passwordRequired; // Fixed
                    }
                    if (value.length < 6) {
                      return AppLocalizations.of(context).passwordLength; // Fixed
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).confirmPassword, // Fixed
                    prefixIcon: const Icon(Icons.lock_outline),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context).confirmPasswordRequired; // Fixed
                    }
                    if (value != _passwordController.text) {
                      return AppLocalizations.of(context).passwordsDontMatch; // Fixed
                    }
                    return null;
                  },
                ),
              ],
              if (_isLogin && _loginWithOtp) ...[
                const SizedBox(height: 16),
                TextFormField(
                  controller: _otpController,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).enterOtp, // Fixed
                    prefixIcon: const Icon(Icons.sms),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context).otpRequired; // Fixed
                    }
                    if (value.length != 6) {
                      return AppLocalizations.of(context).validOtpRequired; // Fixed
                    }
                    return null;
                  },
                ),
              ],
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacementNamed(context, '/citizen-dashboard');
                  }
                },
                child: Text(_isLogin 
                    ? AppLocalizations.of(context).login // Fixed
                    : AppLocalizations.of(context).signup), // Fixed
              ),
              const SizedBox(height: 16),
              if (_isLogin) ...[
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey.shade300,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(AppLocalizations.of(context).or), // Fixed
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey.shade300,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      _loginWithOtp = !_loginWithOtp;
                    });
                  },
                  child: Text(_loginWithOtp 
                      ? AppLocalizations.of(context).loginWithPassword // Fixed
                      : AppLocalizations.of(context).loginWithOtp), // Fixed
                ),
              ],
              const SizedBox(height: 24),
              TextButton(
                onPressed: () {
                  setState(() {
                    _isLogin = !_isLogin;
                    _loginWithOtp = false;
                  });
                },
                child: Text(_isLogin
                    ? AppLocalizations.of(context).dontHaveAccount // Fixed
                    : AppLocalizations.of(context).alreadyHaveAccount), // Fixed
              ),
            ],
          ),
        ),
      ),
    );
  }
}