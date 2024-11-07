import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Profile',
          style: TextStyle(fontFamily: 'Technoma', fontSize: 28),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Center(
          child: Text(
        'Profile information will be here soon',
        style: TextStyle(fontFamily: 'technoma', fontSize: 24),
      )),
    );
  }
}
