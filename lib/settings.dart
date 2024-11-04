import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'),
      ),
      body: Center(
        child: Text(
          'This is settings page',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
