// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:inkflow/pages/canvas.dart';
import 'package:inkflow/pages/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoodleFileCreation extends StatefulWidget {
  const DoodleFileCreation({super.key});

  @override
  _DoodleFileCreationState createState() => _DoodleFileCreationState();
}

class _DoodleFileCreationState extends State<DoodleFileCreation> {
  List<String> doodles = [];

  @override
  void initState() {
    super.initState();
    _loadDoodles();
  }

  // Load saved doodles from shared preferences
  void _loadDoodles() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      doodles = prefs.getStringList('doodles') ?? [];
    });
  }

  // Save doodles list to shared preferences
  void _saveDoodles() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('doodles', doodles);
  }

  // Show a dialog to enter the name of the new doodle
  void _createNewDoodle() async {
    TextEditingController controller = TextEditingController();

    // Show dialog to input doodle name
    bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          backgroundColor: Colors.blue,
          title: Text(
            'Enter Doodle Name',
            style: TextStyle(
                fontFamily: 'Technoma', fontSize: 22, color: Colors.white),
          ),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: "Doodle Name",
              hintStyle: TextStyle(
                  fontFamily: 'Technoma',
                  fontSize: 18,
                  color: Colors.white.withOpacity(0.6)),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Cancel
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                    fontFamily: 'Technoma', color: Colors.white, fontSize: 20),
              ),
            ),
            TextButton(
              onPressed: () {
                String name = controller.text.trim();
                if (name.isNotEmpty) {
                  Navigator.of(context).pop(true); // Proceed with the name
                  _navigateToCanvas(name);
                } else {
                  // Handle empty name input, optional.
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Please enter a name for the doodle'),
                  ));
                }
              },
              child: Text(
                'OK',
                style: TextStyle(
                    fontFamily: 'Technoma', color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        );
      },
    );

    // If confirmed, proceed with saving the doodle name and going to canvas
    if (confirmed != null && confirmed) {
      // Save doodle to list
      setState(() {
        doodles.add(controller.text);
      });
      _saveDoodles();
    }
  }

  // Navigate to the canvas page with the doodle name
  void _navigateToCanvas(String doodleName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CanvasPage(doodleName: doodleName),
      ),
    );
  }

  // Delete a doodle from the list and save updated list
  void _deleteDoodle(int index) {
    setState(() {
      doodles.removeAt(index);
    });
    _saveDoodles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ));
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 24,
                )),
            backgroundColor: Colors.blue,
            title: Text(
              'Doodles',
              style: TextStyle(
                  fontFamily: 'Technoma', fontSize: 32, color: Colors.white),
            )),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 28,
              ),
              // Container with "Create New Doodle" button
              Container(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 4),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(1),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Create New Doodle',
                      style: TextStyle(
                          fontFamily: 'Technoma',
                          fontSize: 24,
                          color: Colors.white),
                    ),
                    Icon(
                      Icons.brush,
                      color: Colors.white,
                      size: 32,
                    ),
                    Container(
                      height: 44.0, // Set the height of the container
                      width: 44.0, // Set the width of the container
                      decoration: BoxDecoration(
                        shape: BoxShape.circle, // Makes the container circular
                        border: Border.all(
                          color: Colors.white, // Set the border color
                          width: 4.0, // Set the border width
                        ),
                        color: Colors
                            .transparent, // Make the background transparent
                      ),
                      child: Center(
                        // Use Center to align the child widget in the middle
                        child: IconButton(
                          onPressed: _createNewDoodle,
                          icon: Icon(
                            Icons.add_outlined,
                            color: Colors.white,
                            size: 18.0, // Icon size
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 28),
              Text(
                'Your Recent Doodles - ',
                style: TextStyle(fontFamily: 'Technoma', fontSize: 24),
              ),
              SizedBox(height: 20),

              // ListView for displaying recent doodles
              Expanded(
                child: doodles.isEmpty
                    ? Center(
                        child: Text(
                        'You Have No doodles yet',
                        style: TextStyle(fontFamily: 'Technoma', fontSize: 20),
                      ))
                    : ListView.builder(
                        itemCount: doodles.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: ListTile(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 32),
                              tileColor: Colors.blue,
                              title: Text(
                                doodles[index],
                                style: TextStyle(
                                    fontFamily: 'Technoma',
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                              trailing: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors
                                            .white, // Set the border color
                                        width: 4.0, // Set the border width
                                      ),
                                      color: Colors.transparent),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                    onPressed: () => _deleteDoodle(index),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ));
  }
}
