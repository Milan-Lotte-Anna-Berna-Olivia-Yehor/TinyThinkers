import 'package:flutter/material.dart';
import 'avatar_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String user = _usernameController.text.trim();
    String pass = _passwordController.text.trim();

    if (user.toLowerCase() == "admin" && pass == "admin") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AvatarScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Wrong credentials! Try 'admin' / 'admin'"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF0E6),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // --- OBROVSKÉ LOGO ---
                Image.asset(
                  'assets/images/brain.png',
                  height: 140, // Zväčšené zo 100 na 140
                ),
                const SizedBox(height: 10),
                const Text(
                  "Tiny\nThinkers",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 42, // Zväčšené písmo
                    fontWeight: FontWeight.w900,
                    color: Colors.black87,
                    height: 1.0,
                  ),
                ),
                
                const SizedBox(height: 50),
                
                const Text(
                  "Login",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF3B7EA0)),
                ),

                const SizedBox(height: 30),

                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: "Username",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
                    prefixIcon: const Icon(Icons.person, color: Color(0xFF3B7EA0)),
                  ),
                ),
                
                const SizedBox(height: 20),

                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
                    prefixIcon: const Icon(Icons.lock, color: Color(0xFF3B7EA0)),
                  ),
                ),

                const SizedBox(height: 40),

                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3B7EA0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      elevation: 5,
                    ),
                    onPressed: _login,
                    child: const Text("Log in", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}