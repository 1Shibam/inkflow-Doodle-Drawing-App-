// ignore_for_file: use_build_context_synchronously, unused_import, unnecessary_import, avoid_unnecessary_containers

import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:inkflow/forgot_password.dart';
import 'package:inkflow/signup_page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  // Sign in function with error handling
  signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login failed: ${e.toString()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              fontFamily: 'Digital',
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
                                          fontFamily: 'Digital',
                                          fontSize: 24,
                                        ),
                                        controller: email,
                                        decoration: InputDecoration(
                                            hintText: 'Enter Your Email',
                                            hintStyle: TextStyle(
                                                fontFamily: 'Digital',
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
                                        style: TextStyle(
                                          fontFamily: 'Digital',
                                          fontSize: 24,
                                        ),
                                        controller: password,
                                        decoration: InputDecoration(
                                            hintText: 'Enter Your Password',
                                            hintStyle: TextStyle(
                                                fontFamily: 'Digital',
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
                                        fontFamily: 'Digital',
                                        color: Colors.black.withOpacity(0.7),
                                        fontSize: 16,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SignupPage()));
                                      },
                                      child: Text(
                                        'Sign Up',
                                        style: TextStyle(
                                          fontFamily: 'Digital',
                                          color: const Color.fromARGB(
                                                  255, 0, 153, 255)
                                              .withOpacity(0.7),
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 76,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ForgotPasswordPage()));
                                      },
                                      child: Text(
                                        'Forgot Password?',
                                        style: TextStyle(
                                          fontFamily: 'Digital',
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
                                    fontFamily: 'Digital',
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
                                  fontFamily: 'Digital',
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
