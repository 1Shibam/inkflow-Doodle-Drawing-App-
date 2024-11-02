// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final String gifPath;

  const Loader({super.key, required this.gifPath});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(gifPath), // Use your GIF path here
    );
  }
}

class myDialog {
  static Future<void> myLoader(
      BuildContext context, Widget page, String gifPath) async {
    // Show the loader dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          content: Loader(gifPath: gifPath), // Use the Loader widget
        );
      },
    );

    // Wait for 1 second
    await Future.delayed(Duration(seconds: 1));

    // Close the loader dialog
    Navigator.of(context).pop();

    // Navigate to the new page
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }
}
