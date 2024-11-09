// // ignore_for_file: unused_field, prefer_final_fields, avoid_function_literals_in_foreach_calls

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:inkflow/auth/wrapper.dart';
// import 'package:inkflow/methods/mydrawer.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   //Document Ids
//   List<String> documentIds = [];
//   List<String> doodles = [];
//   @override
//   void initState() {
//     super.initState();
//     _loadDoodles();
//   }

//   void _loadDoodles() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       doodles = prefs.getStringList('doodles') ?? [];
//     });
//   }

//   // Save doodles list to shared preferences
//   void _saveDoodles() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setStringList('doodles', doodles);
//   }

//   // Add new doodle and save it
//   void _createNewDoodle() {
//     setState(() {
//       doodles.add('Doodle ${doodles.length + 1}'); // Example doodle name
//     });
//     _saveDoodles();
//   }

//   // Delete a doodle from the list and save updated list
//   void _deleteDoodle(int index) {
//     setState(() {
//       doodles.removeAt(index);
//     });
//     _saveDoodles();
//   }

//   //getting document Ids
//   Future getUserId() async {
//     documentIds.clear();
//     await FirebaseFirestore.instance
//         .collection('Users')
//         .get()
//         .then((snapshots) => snapshots.docs.forEach((userDocuments) {
//               documentIds.add(userDocuments.reference.id);
//             }));
//   }

//   bool _isclicked = false;
//   final User? user = FirebaseAuth.instance.currentUser;
//   signout() async {
//     await FirebaseAuth.instance.signOut();
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => const Wrapper()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         leading: IconButton(
//             onPressed: () {
//               _scaffoldKey.currentState?.openDrawer();
//             },
//             icon: Icon(
//               Icons.menu,
//               color: Colors.white,
//             )),
//         title: Text(
//           'Homepage',
//           style: TextStyle(
//               fontFamily: 'Technoma', fontSize: 32, color: Colors.white),
//         ),
//         backgroundColor: Colors.blue,
//       ),
//       backgroundColor: Colors.white,
//       drawer: Mydrawer(),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 28,
//             ),
//             // Container with "Create New Doodle" button
//             Container(
//               padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 4),
//               decoration: BoxDecoration(
//                 color: Colors.blue.withOpacity(1),
//                 borderRadius: BorderRadius.circular(2),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Text(
//                     'Create New Doodle',
//                     style: TextStyle(
//                         fontFamily: 'Technoma',
//                         fontSize: 24,
//                         color: Colors.white),
//                   ),
//                   Icon(
//                     Icons.brush,
//                     color: Colors.white,
//                     size: 32,
//                   ),
//                   Container(
//                     height: 40.0, // Set the height of the container
//                     width: 40.0, // Set the width of the container
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle, // Makes the container circular
//                       border: Border.all(
//                         color: Colors.white, // Set the border color
//                         width: 4.0, // Set the border width
//                       ),
//                       color:
//                           Colors.transparent, // Make the background transparent
//                     ),
//                     child: Center(
//                       // Use Center to align the child widget in the middle
//                       child: IconButton(
//                         onPressed: _createNewDoodle,
//                         icon: Icon(
//                           Icons.add_outlined,
//                           color: Colors.white,
//                           size: 18.0, // Icon size
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(height: 28),
//             Text(
//               'Your Recent Doodles - ',
//               style: TextStyle(fontFamily: 'Technoma', fontSize: 24),
//             ),
//             SizedBox(height: 20),

//             // ListView for displaying recent doodles
//             Expanded(
//               child: doodles.isEmpty
//                   ? Center(
//                       child: Text(
//                       'You Have No doodles yet',
//                       style: TextStyle(fontFamily: 'Technoma', fontSize: 20),
//                     ))
//                   : ListView.builder(
//                       itemCount: doodles.length,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 8),
//                           child: ListTile(
//                             contentPadding:
//                                 EdgeInsets.symmetric(horizontal: 32),
//                             tileColor: Colors.blue,
//                             title: Text(
//                               doodles[index],
//                               style: TextStyle(
//                                   fontFamily: 'Technoma',
//                                   fontSize: 20,
//                                   color: Colors.white),
//                             ),
//                             trailing: Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(vertical: 8.0),
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     border: Border.all(
//                                       color:
//                                           Colors.white, // Set the border color
//                                       width: 4.0, // Set the border width
//                                     ),
//                                     color: Colors.transparent),
//                                 child: IconButton(
//                                   icon: Icon(
//                                     Icons.delete,
//                                     color: Colors.white,
//                                     size: 18,
//                                   ),
//                                   onPressed: () => _deleteDoodle(index),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:inkflow/methods/mydrawer.dart';
import 'package:inkflow/pages/file_creation_page.dart';

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
                        builder: (context) => DoodleFileCreation(),
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
