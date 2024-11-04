// ignore_for_file: unused_field, prefer_final_fields

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inkflow/auth/wrapper.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Gharpage extends StatefulWidget {
  const Gharpage({super.key});

  @override
  State<Gharpage> createState() => _GharpageState();
}

class _GharpageState extends State<Gharpage> {
  bool _isclicked = false;
  @override
  void initState() {
    super.initState();
    requestStoragePermission(context);
  }

  final User? user = FirebaseAuth.instance.currentUser;
  signout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Wrapper()),
    );
  }

  Future<void> requestStoragePermission(BuildContext context) async {
    // Check current permission status
    var status = await Permission.storage.status;

    if (status.isDenied) {
      // Show a dialog explaining why the permission is needed
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Storage Permission Required"),
            content: Text(
              "This app needs storage permission to save items. Please allow access.",
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  // Request storage permission again
                  var newStatus = await Permission.storage.request();
                  // Check if the user granted the permission
                  if (newStatus.isGranted) {
                    // Permission granted, you can proceed with your app functionality
                  } else if (newStatus.isPermanentlyDenied) {
                    // Direct user to app settings if permission is permanently denied
                    await openAppSettings();
                  }
                },
                child: Text("Allow"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Just close the dialog
                },
                child: Text("Deny"),
              ),
            ],
          );
        },
      );
    } else if (status.isPermanentlyDenied) {
      // Direct user to app settings if permission is permanently denied
      await openAppSettings();
    } else {
      // Permission already granted, you can proceed with your app functionality
    }
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
