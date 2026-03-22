import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF071B34),
              Color(0xFF0A2A4F),
              Color(0xFF071B34),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  const SizedBox(height: 40),

                  const Text(
                    "AI BLUEPRINT ESTIMATION SYSTEM",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.cyanAccent,
                      letterSpacing: 2,
                      fontSize: 13,
                    ),
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    "Welcome Back",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  const Text(
                    "Sign in to continue",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 40),

                  _label("Email Address"),
                  const SizedBox(height: 8),
                  _buildTextField(
                    controller: _emailController,
                    hint: "Enter your email",
                    icon: Icons.email_outlined,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      }
                      if (!value.contains("@")) {
                        return "Enter valid email";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 25),

                  _label("Password"),
                  const SizedBox(height: 8),
                  _buildTextField(
                    controller: _passwordController,
                    hint: "Enter your password",
                    icon: Icons.lock_outline,
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }
                      if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 35),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print("Email: ${_emailController.text}");
                          print("Password: ${_passwordController.text}");

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Login Successful"),
                            ),
                          );
                        }
                      },
                      child: Ink(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF22C1C3),
                              Color(0xFF8EDB28),
                            ],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: const Center(
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(color: Colors.white54),
                      ),
                      TextButton(
                        onPressed: () {

                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Color(0xFF8EDB28),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget _label(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.cyanAccent,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    String? Function(String?)? validator,
    bool isPassword = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword ? !_isPasswordVisible : false,
      validator: validator,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white54),
        prefixIcon: Icon(icon, color: Colors.cyanAccent),
        suffixIcon: isPassword
            ? IconButton(
          icon: Icon(
            _isPasswordVisible
                ? Icons.visibility
                : Icons.visibility_off,
            color: Colors.cyanAccent,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        )
            : null,
        filled: true,
        fillColor: const Color(0xFF081E3A),
        contentPadding:
        const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.cyanAccent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide:
          const BorderSide(color: Colors.lightGreenAccent, width: 1.5),
        ),
      ),
    );
  }
}