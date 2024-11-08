import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inkflow/methods/loader.dart';
import 'package:inkflow/methods/snackbar.dart';
import 'package:inkflow/pages/forgot_password.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //user
  final currentUser = FirebaseAuth.instance.currentUser!;

  //all users

  final userCollection = FirebaseFirestore.instance.collection("Users");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 24,
              )),
          centerTitle: true,
          title: const Text(
            'Profile',
            style: TextStyle(
                fontFamily: 'Technoma', fontSize: 28, color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        backgroundColor: Colors.white,
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("Users")
              .doc(currentUser.email)
              .snapshots(),
          builder: (context, snapshot) {
            //get user data
            if (snapshot.hasData) {
              final userData = snapshot.data!.data() as Map<String, dynamic>;
              return ListView(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Icon(Icons.person, size: 140, color: Colors.blue),
                  const SizedBox(
                    height: 20,
                  ),
//username
                  Align(
                    alignment: Alignment.center,
                    child: Flexible(
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: ShapeDecoration(
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            )),
                        width: 380,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'User Name',
                                    style: TextStyle(
                                        fontFamily: 'Technoma',
                                        fontSize: 18,
                                        color: Colors.white),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        editUserName(context);
                                      },
                                      icon: const Icon(
                                        Icons.edit_outlined,
                                        color: Colors.white,
                                        size: 32,
                                      ))
                                ],
                              ),
                              const Divider(
                                color: Colors.white,
                                height: 0,
                                thickness: 1.2,
                                endIndent: 96,
                              ),
                              Text(
                                userData['username'],
                                style: const TextStyle(
                                    fontFamily: 'Technoma',
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  //email
                  Align(
                    alignment: Alignment.center,
                    child: Flexible(
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: ShapeDecoration(
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            )),
                        width: 380,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Email',
                                    style: TextStyle(
                                        fontFamily: 'Technoma',
                                        fontSize: 18,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              const Divider(
                                color: Colors.white,
                                height: 0,
                                thickness: 1.2,
                                endIndent: 96,
                              ),
                              Text(
                                maskEmail(currentUser.email!),
                                style: const TextStyle(
                                    fontFamily: 'Technoma',
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),

                  //Pawword
                  Align(
                    alignment: Alignment.center,
                    child: Flexible(
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: ShapeDecoration(
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            )),
                        width: 380,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Password',
                                    style: TextStyle(
                                        fontFamily: 'Technoma',
                                        fontSize: 18,
                                        color: Colors.white),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        myDialog.myLoader(
                                            context,
                                            const ForgotPasswordPage(),
                                            'assets/images/Rhombus.gif');
                                      },
                                      icon: const Icon(
                                        Icons.edit_outlined,
                                        color: Colors.white,
                                        size: 32,
                                      ))
                                ],
                              ),
                              const Divider(
                                color: Colors.white,
                                height: 0,
                                thickness: 1.2,
                                endIndent: 96,
                              ),
                              Text(
                                '*' * userData["password"].length,
                                style: const TextStyle(
                                    fontFamily: 'Technoma',
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // profile picture

                  // name

                  // email

                  // joined on
                ],
              );
            } else if (snapshot.hasError) {
              showMyScaffold(context, snapshot.error.toString());
            }
            return const CircularProgressIndicator();
          },
        ));
  }
}
//change the user name

Future<void> editUserName(context) async {
  String newvalue = "";
  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.blue,
      title: Text(
        'Change Username',
        style: TextStyle(
            fontFamily: 'Technoma', fontSize: 18, color: Colors.white),
      ),
      content: TextField(
        autofocus: true,
        style: TextStyle(
          fontFamily: 'Technoma',
          fontSize: 16,
          color: Colors.white,
        ),
        decoration: InputDecoration(
            hintText: 'Enter new Username',
            hintStyle: TextStyle(color: Colors.grey)),
        onChanged: (value) {
          newvalue = value;
        },
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(newvalue);
            },
            child: Text(
              'Cancel',
              style: TextStyle(
                  fontFamily: 'Technoma', fontSize: 12, color: Colors.white),
            )),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Save',
              style: TextStyle(
                  fontFamily: 'Technoma', fontSize: 12, color: Colors.white),
            ))
      ],
    ),
  );
}
//updating the name in firestore

//updating the name in firestore

//method for masking the user email
String maskEmail(String email) {
  int atIndex = email.indexOf('@');
  if (atIndex == -1) {
    return email; // Returns original if no @ found in the email
  }

  String localPart = email.substring(0, atIndex);
  String domainPart = email.substring(atIndex);

  // Masking the local part
  if (localPart.length > 4) {
    localPart = localPart.substring(0, 2) +
        '*' * (localPart.length - 4) +
        localPart.substring(localPart.length - 2);
  }

  return localPart + domainPart;
}
