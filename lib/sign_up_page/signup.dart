import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../otp_verification_page/otp_verification.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Space for the SVG image
              Center(
                child: SvgPicture.asset(
                  'assets/icons/sign_up/signup_image.svg', // Add the SVG file to your assets folder
                  height: 200, // Adjust the height as needed
                  width: 200, // Adjust the width as needed
                ),
              ),
              const SizedBox(height: 20),

              Text(
                'Sign Up',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: const Color(0xFF279AF1),
                    ),
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: const TextStyle(color: Color(0xFF000000)),
                  border: const OutlineInputBorder(),
                  prefixIcon:
                      const Icon(Icons.person, color: Color(0xFF000000)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email-ID',
                  labelStyle: const TextStyle(color: Color(0xFF000000)),
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.email, color: Color(0xFF000000)),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: const TextStyle(color: Color(0xFF000000)),
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.lock, color: Color(0xFF000000)),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: const TextStyle(color: Color(0xFF000000)),
                  border: const OutlineInputBorder(),
                  prefixIcon:
                      const Icon(Icons.lock_outline, color: Color(0xFF000000)),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OTPVerificationPage()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: const Color(0xFF279AF1),
                ),
                child: const Text('Sign Up', style: TextStyle(fontSize: 18)),
              ),

              const SizedBox(height: 20),

              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text(
                    'Already have an account? Log in',
                    style: TextStyle(fontSize: 16, color: Color(0xFF279AF1)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
