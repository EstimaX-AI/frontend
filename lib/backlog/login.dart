import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                const SizedBox(height: 30),
                // SizedBox(
                //   height: 80,
                //   child: Center(
                //     child: Image.asset(
                //       "assets/images/logo.png",
                //       height: 60,
                //     ),
                //   ),
                // ),

                const SizedBox(height: 10),

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
                  hint: "Enter your email",
                  icon: Icons.email_outlined,
                ),

                const SizedBox(height: 25),

                _label("Password"),
                const SizedBox(height: 8),
                _buildTextField(
                  hint: "Enter your password",
                  icon: Icons.lock_outline,
                  isPassword: true,
                ),

                const SizedBox(height: 12),

                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Colors.lightGreenAccent.shade400,
                      fontSize: 13,
                    ),
                  ),
                ),

                const SizedBox(height: 35),

                Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF22C1C3),
                        Color(0xFF8EDB28),
                      ],
                    ),
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

                const SizedBox(height: 30),

                // Row(
                //   children: const [
                //     Expanded(child: Divider(color: Colors.white30)),
                //     Padding(
                //       padding: EdgeInsets.symmetric(horizontal: 10),
                //       child: Text(
                //         "OR",
                //         style: TextStyle(color: Colors.white54),
                //       ),
                //     ),
                //     Expanded(child: Divider(color: Colors.white30)),
                //   ],
                // ),

                // const SizedBox(height: 30),

                // Container(
                //   width: double.infinity,
                //   height: 55,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(30),
                //     border: Border.all(color: Colors.cyanAccent),
                //   ),
                //   child: const Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Icon(Icons.fingerprint, color: Colors.cyanAccent),
                //       SizedBox(width: 10),
                //       Text(
                //         "Use Biometric Login",
                //         style: TextStyle(
                //           color: Colors.cyanAccent,
                //           fontSize: 16,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),

                const SizedBox(height: 40),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(color: Colors.white54),
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Color(0xFF8EDB28),
                        fontWeight: FontWeight.bold,
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

  static Widget _buildTextField({
    required String hint,
    required IconData icon,
    bool isPassword = false,
  }) {
    return TextField(
      obscureText: isPassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white54),
        prefixIcon: Icon(icon, color: Colors.cyanAccent),
        suffixIcon: isPassword
            ? const Icon(Icons.visibility_outlined,
            color: Colors.cyanAccent)
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