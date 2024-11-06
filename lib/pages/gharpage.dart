// ignore_for_file: unused_field, prefer_final_fields, avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inkflow/auth/wrapper.dart';

class Gharpage extends StatefulWidget {
  const Gharpage({super.key});

  @override
  State<Gharpage> createState() => _GharpageState();
}

class _GharpageState extends State<Gharpage> {
  //Document Ids
  List<String> documentIds = [];

  //getting document Ids
  Future getUserId() async {
    documentIds.clear();
    await FirebaseFirestore.instance
        .collection('Users')
        .get()
        .then((snapshots) => snapshots.docs.forEach((userDocuments) {
              documentIds.add(userDocuments.reference.id);
            }));
  }

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: user != null
                  ? Text('Welcome, ${user!.email}')
                  : Text('No user information available.'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: signout,
        child: const Icon(Icons.logout),
      ),
    );
  }
}
