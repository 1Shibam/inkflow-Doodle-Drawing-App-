import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';

class DrawingPage extends StatefulWidget {
  const DrawingPage({super.key});

  @override
  State<DrawingPage> createState() => _DrawingPageState();
}

class _DrawingPageState extends State<DrawingPage> {
  @override
  void initState() {
    super.initState();
    _controller = DrawingController();
  }

  late DrawingController _controller;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 16),
          child: IconButton(
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.blue)),
            onPressed: () {
              saveTheDoodle();
            },
            icon: Icon(
              Icons.save_alt,
              color: Colors.white,
              size: 32,
            ),
          ),
        ),
      ),
      body: DrawingBoard(
        controller: _controller,
        background: Container(
          color: Colors.white,
          height: double.maxFinite,
          width: double.maxFinite,
        ),
        showDefaultActions: true,
        showDefaultTools: true,
      ),
    );
  }

  Future<void> saveTheDoodle() async {
    try {
      final imageData = await _controller.getImageData();
      if (imageData == null) {
        print('no data to save');
        return;
      }

      String path;
      final directory = Directory('/storage/emulated/0/Pictures');
      if (!directory.existsSync()) {
        directory.createSync(recursive: true);
      }
      path = "${directory.path}/inkfloww.png";
      final file = File(path);
      await file.writeAsBytes(imageData.buffer.asInt8List());
      print('the Drawing is saved succesfully at $path');
    } catch (error) {
      print('error - $error');
    }
  }
}
