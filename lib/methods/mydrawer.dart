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
            icon: Icons.logout,
            text: 'LOGOUT',
            onTap: () {
              signout();
            },
          ),
          MyListTile(
            icon: Icons.settings,
            text: 'SETTINGS',
            onTap: () {},
          ),
          MyListTile(
            icon: Icons.info,
            text: 'ABOUT',
            onTap: () {
              myDialog.myLoader(
                  context, AboutPage(), 'assets/images/loaderAnimation.gif');
            },
          ),

          //home list title

          //profile list title

          //logout list title
        ],
      ),
    );
  }
}
