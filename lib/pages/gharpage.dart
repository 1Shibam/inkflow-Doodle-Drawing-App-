// ignore_for_file: unused_field, prefer_final_fields, avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inkflow/auth/wrapper.dart';
import 'package:inkflow/methods/mydrawer.dart';

class Gharpage extends StatefulWidget {
  const Gharpage({super.key});

  @override
  State<Gharpage> createState() => _GharpageState();
}

class _GharpageState extends State<Gharpage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            )),
        title: Text(
          'Homepage',
          style: TextStyle(
              fontFamily: 'Technoma',
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      drawer: Mydrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [],
        ),
      ),
    );
  }
}
