import 'package:flutter/material.dart';

import 'package:inkflow/methods/mydrawer.dart';
import 'package:inkflow/pages/drawing_canvas.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  //Document Ids
  List<String> documentIds = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            )),
        title: Text(
          'InkFloww',
          style: TextStyle(
              fontFamily: 'Technoma', fontSize: 32, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      drawer: Mydrawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Welcome Text
              Text(
                'Welcome to Inkflow!',
                style: TextStyle(
                  fontFamily: 'Technoma',
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 28),

              Text(
                'Unleash your creativity with Inkflow. Start creating doodles and saving your art today!',
                style: TextStyle(
                    fontSize: 24, color: Colors.black, fontFamily: 'Technoma'),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 48),
              GestureDetector(
                onTap: () {
                  //navigate to the canvas
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DrawingPage(),
                      ));
                },
                child: ListTile(
                  tileColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  title: Center(
                    child: const Text(
                      'Create new Doodle',
                      style: TextStyle(
                          fontFamily: 'Technoma',
                          fontSize: 24,
                          color: Colors.white),
                    ),
                  ),
                ),
              )

              // Get Started Button
            ],
          ),
        ),
      ),
    );
  }
}
