import 'package:flutter/material.dart';
import 'package:inkflow/drawing_part/doodle_list_screen.dart';
import 'package:inkflow/methods/mydrawer.dart';

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
          'Homepage',
          style: TextStyle(
              fontFamily: 'Technoma', fontSize: 32, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      drawer: Mydrawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
              SizedBox(height: 24),

              Text(
                'Unleash your creativity with Inkflow. Start creating doodles and saving your art today!',
                style: TextStyle(
                    fontSize: 24, color: Colors.black, fontFamily: 'Technoma'),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32),

              // Get Started Button
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DoodleListScreen(),
                      ));
                },
                icon: Icon(Icons.arrow_forward, color: Colors.white),
                label: Text(
                  'Get Started',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Technoma',
                      color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
