import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailControl = TextEditingController();
  @override
  void dispose() {
    _emailControl.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailControl.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(
                'Password Reset Link Sent to your email, Please check!',
                style: TextStyle(fontFamily: 'Technoma'),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
                // Set the radius here
              ),
            );
          });
    } on FirebaseAuthException catch (e) {
      // showMyScaffold(context, e.toString());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(
                e.message.toString(),
                style: TextStyle(fontFamily: 'Technoma'),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
                // Set the radius here
              ),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forgot Password",
          style: TextStyle(
              fontFamily: 'Technoma',
              fontWeight: FontWeight.bold,
              fontSize: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0).copyWith(top: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Reset Your Password",
              style: TextStyle(
                  fontFamily: 'Technoma',
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),

            TextField(
              controller: _emailControl,
              style: TextStyle(
                  fontFamily: 'Technoma',
                  fontSize: 20,
                  color: Colors.black.withOpacity(1)),
              decoration: InputDecoration(
                labelText: "Enter your email",
                labelStyle: TextStyle(
                    fontFamily: 'Technoma',
                    fontSize: 20,
                    color: Colors.black.withOpacity(0.5)),
                hintText: "e.g. example@domain.com",
                hintStyle: TextStyle(
                    fontFamily: 'Technoma',
                    fontSize: 20,
                    color: Colors.black.withOpacity(0.5)),
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.blue,
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),

            // Reset Password Button
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blue)),
              onPressed: passwordReset,
              child: Text(
                "Send Reset Link",
                style: TextStyle(
                    fontFamily: 'Technoma',
                    fontSize: 20,
                    color: Colors.black.withOpacity(1)),
              ),
            ),

            // Back to Login link
            TextButton(
              onPressed: () {
                Navigator.pop(context); //
              },
              child: Text(
                "Back to Login",
                style: TextStyle(
                    fontFamily: 'Technoma',
                    fontSize: 16,
                    color: Colors.blue.withOpacity(1)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
