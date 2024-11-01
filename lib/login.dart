// ignore_for_file: use_build_context_synchronously, unused_import

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
      body: Stack(
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Opacity(
              opacity: 0.4,
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
                    SizedBox(
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
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28, vertical: 10),
                      child: Text(
                        'Welcome to Inkflow Login before you continue...',
                        style: TextStyle(
                            fontFamily: 'Hand-Doodle',
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 400,
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.6),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: TextField(
                                  controller: email,
                                  decoration: InputDecoration(
                                    hintText: 'Enter your Email',
                                    fillColor:
                                        const Color.fromARGB(255, 0, 140, 255),
                                    hintStyle: TextStyle(
                                        fontFamily: 'Hand-Doodle',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
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
                              color: Colors.blue.withOpacity(0.6),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: TextField(
                                  controller: password,
                                  decoration: InputDecoration(
                                    hintText: 'Enter your password',
                                    fillColor:
                                        const Color.fromARGB(255, 0, 140, 255),
                                    hintStyle: TextStyle(
                                        fontFamily: 'Hand-Doodle',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
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
            ],
          ),
        ],
      ),
    );
  }
}
