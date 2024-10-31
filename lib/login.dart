// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

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
          style: TextStyle(
              fontFamily: 'Hand-Doodle',
              fontSize: 40,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
                alignment: Alignment.center,
                child: Image(
                    width: 160,
                    height: 160,
                    image: Svg('assets/images/cat-lol-svgrepo-com.svg'))),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, top: 20),
              child: SizedBox(
                width: 400,
                height: 60,
                child: Text(
                  'Welcome to Inkflow Login before you continue...',
                  style: TextStyle(
                      fontFamily: 'Hand-Doodle',
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
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
                            hintStyle: TextStyle(fontFamily: 'Hand-Doodle'),
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
                            hintStyle: TextStyle(fontFamily: 'Hand-Doodle'),
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
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontFamily: 'Hand-Doodle',
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: SizedBox(
                      width: 400,
                      height: 60,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'OR',
                          style: TextStyle(
                              fontFamily: 'Hand-Doodle',
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
