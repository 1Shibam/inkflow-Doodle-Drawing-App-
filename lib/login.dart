// ignore_for_file: use_build_context_synchronously, unused_import

import 'dart:ffi';
import 'dart:ui';

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
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:
            const Color.fromARGB(255, 0, 140, 255).withOpacity(0.4),
        title: const Text(
          'Login-Page',
          style: TextStyle(
              fontFamily: 'Hand-Doodle',
              fontSize: 40,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Opacity(
                opacity: 0.6,
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/background.png',
                    fit: BoxFit.fill, // Cover the entire screen
                  ),
                ),
              ),
            ),
            Column(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/images/cat animation.gif',
                          width: 120,
                          height: 120,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 28, vertical: 10),
                        child: Text(
                          'Welcome to Inkflow Login before you continue...',
                          style: TextStyle(
                              fontFamily: 'Hand-Doodle',
                              fontSize: 32,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 60,
                              width: 400,
                              decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(16)),
                              child: Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: TextField(
                                    controller: email,
                                    decoration: const InputDecoration(
                                      hintText: 'Enter your Email',
                                      fillColor:
                                          Color.fromARGB(255, 0, 140, 255),
                                      hintStyle: TextStyle(
                                          fontFamily: 'Hand-Doodle',
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                      alignLabelWithHint: true,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Container(
                              height: 60,
                              width: 400,
                              decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(16)),
                              child: Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: TextField(
                                    controller: password,
                                    decoration: const InputDecoration(
                                      hintText: 'Enter your password',
                                      fillColor:
                                          Color.fromARGB(255, 0, 140, 255),
                                      hintStyle: TextStyle(
                                          fontFamily: 'Hand-Doodle',
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                      alignLabelWithHint: true,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            ElevatedButton(
                              onPressed: signIn,
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(
                                    100, 40), // Width: 200, Height: 60
                              ), // Call signIn directly
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                    fontFamily: 'Hand-Doodle',
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 4),
                              child: SizedBox(
                                width: double.infinity,
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
                            Align(
                              alignment: Alignment.center,
                              child: const Row(
                                children: [
                                  Text(
                                    'Sign Up',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontFamily: 'Hand-Doodle',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    ' | ',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontFamily: 'Hand-Doodle',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'forgot password?',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontFamily: 'Hand-Doodle',
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
