import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inkflow/wrapper.dart';
import 'package:permission_handler/permission_handler.dart';

class Gharpage extends StatefulWidget {
  const Gharpage({super.key});

  @override
  State<Gharpage> createState() => _GharpageState();
}

class _GharpageState extends State<Gharpage> {
  @override
  void initState() {
    super.initState();
    // Request permission on app start, or call when needed
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
      body: Center(
        child: user != null
            ? Text('Welcome, ${user!.email}')
            : Text('No user information available.'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: signout,
        child: const Icon(Icons.logout),
      ),
    );
  }
}
