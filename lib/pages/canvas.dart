import 'package:flutter/material.dart';
import 'package:inkflow/pages/file_creation_page.dart';

class CanvasPage extends StatefulWidget {
  final String doodleName;

  const CanvasPage({super.key, required this.doodleName});

  @override
  State<CanvasPage> createState() => _CanvasPageState();
}

class _CanvasPageState extends State<CanvasPage> {
  @override
  Widget build(BuildContext context) {
    // This page would contain your canvas UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Canvas: ${widget.doodleName}',
          style: TextStyle(
              fontFamily: 'Technoma', fontSize: 24, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DoodleFileCreation(),
                  ));
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.blue,
              size: 24,
            )),
      ),
    );
  }
}
