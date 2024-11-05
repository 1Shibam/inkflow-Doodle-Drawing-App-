// ignore_for_file: unused_field, prefer_final_fields

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inkflow/auth/wrapper.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Gharpage extends StatefulWidget {
  const Gharpage({super.key});

  @override
  State<Gharpage> createState() => _GharpageState();
}

class _GharpageState extends State<Gharpage> {
  bool _isclicked = false;
  final User? user = FirebaseAuth.instance.currentUser;
  signout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Wrapper()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
      ),
      body: Column(
        children: [
          Center(
            child: user != null
                ? Text('Welcome, ${user!.email}')
                : Text('No user information available.'),
          ),
          SizedBox(
            height: 80,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  _isclicked = !_isclicked;
                });
              },
              child: Icon(Icons.swap_calls)),
          SvgPicture.asset(
            _isclicked ? 'assets/images/google.svg' : 'assets/images/brush.svg',
            width: 80,
            height: 80,
            fit: BoxFit.scaleDown,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: signout,
        child: const Icon(Icons.logout),
      ),
    );
  }
}
