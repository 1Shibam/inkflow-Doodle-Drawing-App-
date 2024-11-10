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
    // Navigate to canvas screen to create a new doodle
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DoodleCanvasScreen(),
      ),
    );

    if (result == true) {
      _loadDoodles(); // Reload doodles after creating a new one
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doodles'),
      ),
      body: Column(
        children: [
          ElevatedButton.icon(
            onPressed: _createNewDoodle,
            icon: Icon(Icons.add),
            label: Text('Create New Doodle'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _doodles.length,
              itemBuilder: (context, index) {
                final doodle = _doodles[index];
                return ListTile(
                  title: Text(doodle.title),
                  subtitle: Text(doodle.createdAt.toString()),
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
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () async {
                      await DatabaseHelper().deleteDoodle(doodle.id!);
                      _loadDoodles(); // Reload doodles after deletion
                    },
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
