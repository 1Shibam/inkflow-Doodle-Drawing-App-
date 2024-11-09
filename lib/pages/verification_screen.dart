// ignore_for_file: avoid_print

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inkflow/auth/wrapper.dart';
import 'package:inkflow/services/auth_service.dart';

class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({super.key});

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  final _auth = authService();
  late Timer timer;
  @override
  void initState() {
    super.initState();
    _auth.emailVerificationLink();
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      FirebaseAuth.instance.currentUser?.reload();
      if (FirebaseAuth.instance.currentUser!.emailVerified == true) {
        timer.cancel();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Wrapper(),
            ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: const Text(
          'Email Verification',
          style: TextStyle(fontFamily: 'Technoma'),
        ),
        backgroundColor: Colors.blueGrey[800],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Please verify your email address',
              style: TextStyle(
                fontFamily: 'Technoma',
                fontSize: 22,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'We have sent a verification email to your inbox. Please check your email and follow the instructions to verify your account.',
              style: TextStyle(
                fontFamily: 'Technoma',
                fontSize: 16,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                _auth.emailVerificationLink();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Resend Email',
                style: TextStyle(
                  fontFamily: 'Technoma',
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Didn’t receive the email? Check your spam folder or try resending.',
              style: TextStyle(
                fontFamily: 'Technoma',
                fontSize: 14,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
