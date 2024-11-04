import 'package:flutter/material.dart';

void showMyScaffold(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(label: 'Okay', onPressed: () {}),
    ),
  );
}
