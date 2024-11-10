// ignore_for_file: library_private_types_in_public_api, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:inkflow/drawing_part/doodle_model.dart';
import 'database_helper.dart';

class DoodleCanvasScreen extends StatefulWidget {
  final Doodle? doodle; // Nullable for creating new doodles

  const DoodleCanvasScreen({super.key, this.doodle});

  @override
  _DoodleCanvasScreenState createState() => _DoodleCanvasScreenState();
}

class _DoodleCanvasScreenState extends State<DoodleCanvasScreen> {
  List<Offset?> _points = [];
  String _title = '';

  @override
  void initState() {
    super.initState();
    if (widget.doodle != null) {
      _title = widget.doodle!.title;
      _loadDrawingData(widget.doodle!.drawingData);
    }
  }

  void _loadDrawingData(String drawingData) {
    // Parse the JSON data and convert it to points for the canvas
    // (Implementation of loading and parsing JSON is needed here)
  }

  Future<void> _saveDoodle() async {
    final doodle = Doodle(
      id: widget.doodle?.id,
      title: _title,
      createdAt: DateTime.now(),
      drawingData: _pointsToJSON(), // Convert points to JSON string
    );

    if (widget.doodle == null) {
      await DatabaseHelper().insertDoodle(doodle);
    } else {
      // Code to update existing doodle (not implemented here)
    }

    Navigator.pop(context, true); // Indicate that save was successful
  }

  String _pointsToJSON() {
    // Convert _points to JSON format
    // (Implementation for converting points to JSON is needed here)
    return '[]'; // Placeholder
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.doodle == null ? 'New Doodle' : widget.doodle!.title),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveDoodle,
          ),
        ],
      ),
      body: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            _points.add(details.localPosition);
          });
        },
        onPanEnd: (details) {
          _points.add(null); // Used to signify the end of a stroke
        },
        child: CustomPaint(
          painter: DoodlePainter(_points),
          child: Container(),
        ),
      ),
    );
  }
}

class DoodlePainter extends CustomPainter {
  final List<Offset?> points;

  DoodlePainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
