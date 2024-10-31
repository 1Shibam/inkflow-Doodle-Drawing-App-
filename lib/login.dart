// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  // Sign in function with error handling
  signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login failed: ${e.toString()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:
            const Color.fromARGB(255, 0, 140, 255).withOpacity(0.4),
        title: Text(
          'Login-Page',
          style: TextStyle(fontFamily: 'Super-Kinds', fontSize: 24),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.22),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                      hintText: 'Enter your Email',
                      fillColor: const Color.fromARGB(255, 0, 140, 255),
                      hintStyle: TextStyle(fontFamily: 'Super-Kinds'),
                      alignLabelWithHint: true,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 40,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.22),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: password,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      fillColor: const Color.fromARGB(255, 0, 140, 255),
                      hintStyle: TextStyle(fontFamily: 'Super-Kinds'),
                      alignLabelWithHint: true,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
              onPressed: signIn, // Call signIn directly
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
