import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forgot Password",
          style: TextStyle(
              fontFamily: 'Digital', fontWeight: FontWeight.bold, fontSize: 24),
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
                  fontFamily: 'Digital',
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),

            TextField(
              style: TextStyle(
                  fontFamily: 'Digital',
                  fontSize: 20,
                  color: Colors.black.withOpacity(1)),
              decoration: InputDecoration(
                labelText: "Enter your email",
                labelStyle: TextStyle(
                    fontFamily: 'Digital',
                    fontSize: 20,
                    color: Colors.black.withOpacity(0.5)),
                hintText: "e.g. example@domain.com",
                hintStyle: TextStyle(
                    fontFamily: 'Digital',
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
              onPressed: () {},
              child: Text(
                "Send Reset Link",
                style: TextStyle(
                    fontFamily: 'Digital',
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
                    fontFamily: 'Digital',
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
