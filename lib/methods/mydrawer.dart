import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inkflow/auth/wrapper.dart';
import 'package:inkflow/methods/loader.dart';
import 'package:inkflow/methods/my_list_tile.dart';
import 'package:inkflow/pages/about_page.dart';
import 'package:inkflow/pages/profile_page.dart';

class Mydrawer extends StatefulWidget {
  const Mydrawer({super.key});

  @override
  State<Mydrawer> createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {
  signout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Wrapper()),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          title: Text(
            "Confirm Logout",
            style: TextStyle(
                fontFamily: 'Technoma',
                fontWeight: FontWeight.normal,
                color: Colors.white,
                fontSize: 28),
          ),
          content: Text(
            "Are you sure you want to log out?",
            style: TextStyle(
                fontFamily: 'Technoma', color: Colors.white, fontSize: 20),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                "Not Now",
                style: TextStyle(fontFamily: 'Technoma', color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                signout(); // Call the sign-out method
              },
              child: Text(
                "Yes",
                style: TextStyle(fontFamily: 'Technoma', color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue.withOpacity(1),
      child: Column(
        children: [
          //header of drawer
          const Align(
            alignment: Alignment.topCenter,
            child: DrawerHeader(
                child: Icon(
              Icons.person,
              color: Colors.white,
              size: 80,
            )),
          ),
          MyListTile(
            icon: Icons.home,
            text: 'HOME',
            onTap: () {
              Navigator.pop(context);
            },
          ),
          MyListTile(
            icon: Icons.person,
            text: 'PROFILE',
            onTap: () {
              myDialog.myLoader(
                  context, ProfilePage(), 'assets/images/cat animation.gif');
            },
          ),

          MyListTile(
            icon: Icons.info,
            text: 'ABOUT',
            onTap: () {
              myDialog.myLoader(
                  context, AboutPage(), 'assets/images/loaderAnimation.gif');
            },
          ),

          MyListTile(
            icon: Icons.logout,
            text: 'LOGOUT',
            onTap: () {
              _showLogoutDialog(context);
            },
          ),
        ],
      ),
    );
  }
}
