import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inkflow/pages/home_screen.dart';
import 'package:inkflow/pages/login.dart';
import 'package:inkflow/pages/verification_screen.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data?.emailVerified == true) {
                return HomeScreen();
              }
              return EmailVerificationPage();
            } else {
              return Login();
            }
          }),
    );
  }
}
