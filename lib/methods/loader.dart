// ignore_for_file: camel_case_types, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final String gifPath;
  final double width;
  final double height;

  const Loader({
    super.key,
    required this.gifPath,
    this.width = 100.0,
    this.height = 100.0,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        gifPath,
        width: width,
        height: height,
      ), // Use your GIF path here
    );
  }
}

class myDialog {
  static Future<void> myLoader(
      BuildContext context, Widget _page, String gifPath,
      {double gifWidth = 160, double gifHeight = 160}) async {
    // Show the loader dialog
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext dialogContext) {
          return Center(
            child: Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.zero,
              child: SizedBox.expand(
                child: Loader(
                  gifPath: gifPath,
                  width: gifWidth,
                  height: gifHeight,
                ),
              ),
            ),
          );
        },
        barrierColor: Colors.white.withOpacity(1));

    // Wait for 1 second
    await Future.delayed(Duration(milliseconds: 1200));

    // Close the loader dialog
    Navigator.of(context).pop();

    // Navigate to the new page
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => _page));
  }
}
