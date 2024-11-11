// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:inkflow/drawing_part/doodle_model.dart';
import 'database_helper.dart';
import 'doodle_canvas_screen.dart';

class DoodleListScreen extends StatefulWidget {
  const DoodleListScreen({super.key});

  @override
  _DoodleListScreenState createState() => _DoodleListScreenState();
}

class _DoodleListScreenState extends State<DoodleListScreen> {
  Future<String?> _getDoodleName() async {
    String? doodleName;

    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Doodle Name'),
          content: TextField(
            onChanged: (value) {
              doodleName = value;
            },
            decoration: InputDecoration(hintText: "Doodle name"),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, null); // Cancel input
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, doodleName); // Return the doodle name
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  List<Doodle> _doodles = [];

  @override
  void initState() {
    super.initState();
    _loadDoodles(); // Load doodles when screen initializes
  }

  Future<void> _loadDoodles() async {
    final doodles = await DatabaseHelper().getDoodles();
    setState(() {
      _doodles = doodles;
    });
  }

  void _createNewDoodle() async {
    // Ask for the doodle name
    final doodleName = await _getDoodleName();

    if (doodleName != null && doodleName.isNotEmpty) {
      // Create a new Doodle object with the entered name and current date/time
      final doodle = Doodle(
        title: doodleName,
        createdAt: DateTime.now(),
        drawingData:
            '', // This will be updated later with the actual drawing data
      );

      // Save the doodle name in the database
      final dbHelper = DatabaseHelper();
      await dbHelper.insertDoodle(doodle);

      // Navigate to canvas screen to create the doodle
      final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DoodleCanvasScreen(doodle: doodle),
        ),
      );

      // Update the doodle with drawing data if there’s a result
      if (result != null) {
        doodle.drawingData = result; // Save the drawing data to the doodle
        await dbHelper
            .insertDoodle(doodle); // Update the database with the drawing data
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doodles'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: Container(
              height: 72,
              width: 380,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(4)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Create a New Doodle',
                    style: TextStyle(
                      fontFamily: 'Technoma',
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.brush,
                    color: Colors.white,
                    size: 32,
                  ),
                  IconButton(
                      onPressed: _createNewDoodle,
                      icon: Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 4)),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 32,
                        ),
                      ))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              'Your Recent Doodles are below - ',
              style: TextStyle(
                  fontFamily: 'Technoma', fontSize: 24, color: Colors.black),
            ),
          ),
          // ElevatedButton.icon(
          //   onPressed: _createNewDoodle,
          //   icon: Icon(Icons.add),
          //   label: Text('Create New Doodle'),
          // ),
          Expanded(
            child: ListView.builder(
              itemCount: _doodles.length,
              itemBuilder: (context, index) {
                final doodle = _doodles[index];
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    tileColor: Colors.blue,
                    title: Text(doodle.title),
                    subtitle: Text(
                      doodle.createdAt.toString(),
                      style: TextStyle(
                          fontFamily: 'Technoma',
                          fontSize: 12,
                          color: Colors.white),
                    ),
                    onTap: () async {
                      // Open existing doodle in the canvas screen
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DoodleCanvasScreen(doodle: doodle),
                        ),
                      );
                      if (result == true) {
                        _loadDoodles(); // Reload after editing
                      }
                    },
                    trailing: Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4)),
                      child: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        onPressed: () async {
                          await DatabaseHelper().deleteDoodle(doodle.id!);
                          _loadDoodles(); // Reload doodles after deletion
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
