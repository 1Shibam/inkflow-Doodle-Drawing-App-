// ignore_for_file: use_build_context_synchronously, unused_import, unnecessary_import, avoid_unnecessary_containers, unused_field, prefer_final_fields, camel_case_types

import 'dart:ffi';
import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:inkflow/pages/gharpage.dart';

import '../methods/loader.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:inkflow/pages/forgot_password.dart';
import 'package:inkflow/pages/signup_page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isPasswordVisible = false;

  final _email = TextEditingController();
  final _password = TextEditingController();

  // Sign in function with error handling
  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text.trim(), password: _password.text.trim());
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Login failed, Please enter correctly!",
          ),
          action: SnackBarAction(label: 'okay', onPressed: () {}),
        ),
      );
    }
  }

  @override
  void dispose() {
    _email.dispose();

    _password.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/cat animation.gif',
                        width: 160,
                        height: 160,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        child: Text(
                          'Welcome',
                          style: TextStyle(
                              fontFamily: 'Technoma',
                              fontSize: 60,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 80,
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: Colors.black.withOpacity(1),
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Icon(
                                    Icons.email,
                                    color: Colors.white,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: TextField(
                                        style: TextStyle(
                                          fontFamily: 'Technoma',
                                          fontSize: 24,
                                        ),
                                        controller: _email,
                                        decoration: InputDecoration(
                                            hintText: 'Enter Your Email',
                                            hintStyle: TextStyle(
                                                fontFamily: 'Technoma',
                                                fontSize: 24,
                                                color: Colors.black
                                                    .withOpacity(0.3))),
                                      )),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            height: 80,
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                  color: Colors.black.withOpacity(1)),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: TextField(
                                        obscureText: !_isPasswordVisible,
                                        style: TextStyle(
                                          fontFamily: 'Technoma',
                                          fontSize: 24,
                                        ),
                                        controller: _password,
                                        decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                _isPasswordVisible
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _isPasswordVisible =
                                                      !_isPasswordVisible;
                                                });
                                              },
                                            ),
                                            hintText: 'Enter Your Password',
                                            hintStyle: TextStyle(
                                                fontFamily: 'Technoma',
                                                fontSize: 24,
                                                color: Colors.black
                                                    .withOpacity(0.3))),
                                      )),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2.0),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'New Here? ',
                                      style: TextStyle(
                                        fontFamily: 'Technoma',
                                        color: Colors.black.withOpacity(0.7),
                                        fontSize: 16,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        myDialog.myLoader(context, SignupPage(),
                                            'assets/images/loaderAnimation.gif');
                                      },
                                      child: Text(
                                        'Sign Up',
                                        style: TextStyle(
                                          fontFamily: 'Technoma',
                                          color: const Color.fromARGB(
                                                  255, 0, 153, 255)
                                              .withOpacity(0.7),
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        myDialog.myLoader(
                                            context,
                                            ForgotPasswordPage(),
                                            'assets/images/loaderAnimation.gif');
                                      },
                                      child: Text(
                                        'Forgot Password?',
                                        style: TextStyle(
                                          fontFamily: 'Technoma',
                                          color: const Color.fromARGB(
                                                  255, 0, 153, 255)
                                              .withOpacity(0.7),
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            height: 48,
                            width: 160,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                border: Border(),
                                borderRadius: BorderRadius.circular(16)),
                            child: ElevatedButton(
                              onPressed: signIn,
                              style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                      Colors.transparent),
                                  shadowColor: WidgetStatePropertyAll(
                                      Colors.transparent)),
                              child: const Text(
                                'Sign-In',
                                style: TextStyle(
                                    fontFamily: 'Technoma',
                                    fontSize: 24,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
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
                              SizedBox(
                                height: 40,
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
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                IconButton(
                                    onPressed: () {},
                                    icon: SvgPicture.asset(
                                        'assets/images/google.svg'))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
