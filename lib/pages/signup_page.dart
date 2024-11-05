// ignore_for_file: prefer_final_fields, unused_field

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:inkflow/auth/wrapper.dart';
import 'package:inkflow/methods/snackbar.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _isVisible = false;
  TextEditingController myEmail = TextEditingController();
  TextEditingController myPassword = TextEditingController();
  TextEditingController confirmMyPassword = TextEditingController();

  @override
  void dispose() {
    //disposing

    myEmail.dispose();
    myPassword.dispose();
    confirmMyPassword.dispose();
    super.dispose();
  }

  Future signup() async {
    if (passConfirmation()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: myEmail.text.trim(), password: myPassword.text.trim());
      Get.offAll(Wrapper());
    }
  }

  bool passConfirmation() {
    if (myPassword.text.trim() == confirmMyPassword.text.trim()) {
      return true;
    } else {
      showMyScaffold(context, 'passowords do not match!!');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          "Signup Page",
          style: TextStyle(
              fontFamily: 'Technoma',
              fontWeight: FontWeight.bold,
              fontSize: 24),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0).copyWith(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                "Create an Account",
                style: TextStyle(
                  fontFamily: 'Technoma',
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),

              // Name TextField

              // Email TextField
              TextField(
                controller: myEmail,
                style: TextStyle(fontFamily: 'Technoma', fontSize: 20),
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(
                      fontFamily: 'Technoma',
                      fontSize: 20,
                      color: Colors.black.withOpacity(0.5)),
                  hintText: 'e.g. pookierbear@example.com',
                  hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.blue,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),

              // Password TextField
              TextField(
                controller: myPassword,
                style: TextStyle(fontFamily: 'Technoma', fontSize: 20),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isVisible = !_isVisible;
                        });
                      },
                      icon: Icon(_isVisible
                          ? Icons.visibility
                          : Icons.visibility_off)),
                  labelText: "Password",
                  labelStyle: TextStyle(
                      fontFamily: 'Technoma',
                      fontSize: 20,
                      color: Colors.black.withOpacity(0.5)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.blue,
                  ),
                ),
                obscureText: !_isVisible,
              ),
              SizedBox(height: 28),
              TextField(
                controller: confirmMyPassword,
                style: TextStyle(fontFamily: 'Technoma', fontSize: 20),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isVisible = !_isVisible;
                        });
                      },
                      icon: Icon(_isVisible
                          ? Icons.visibility
                          : Icons.visibility_off)),
                  labelText: "Confirm Password",
                  labelStyle: TextStyle(
                      fontFamily: 'Technoma',
                      fontSize: 20,
                      color: Colors.black.withOpacity(0.5)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.blue,
                  ),
                ),
                obscureText: !_isVisible,
              ),
              SizedBox(height: 28),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(100, 50), // Set width and height here
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            12)) // Set the background color
                    ),
                onPressed: (() => signup()),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontFamily: 'Technoma',
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              ),

              // Submit Button

              SizedBox(
                height: 40,
              ),
              Row(
                children: const [
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      thickness: 1,
                      endIndent: 10,
                    ),
                  ),
                  Text(
                    "Or Continue with",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Technoma',
                      fontSize: 20,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      thickness: 1,
                      indent: 10,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('assets/images/google.svg'))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
