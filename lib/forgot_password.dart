import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Reset Your Password",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            // Email TextField
            TextField(
              decoration: InputDecoration(
                labelText: "Enter your email",
                hintText: "e.g. example@domain.com",
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
              onPressed: () {
                // Handle the reset password action
                // You could navigate back or show a success message here
              },
              child: Text("Reset Password"),
            ),

            // Back to Login link
            TextButton(
              onPressed: () {
                // Handle back to login action
                Navigator.pop(
                    context); // For demonstration; navigate back to previous page
              },
              child: Text("Back to Login"),
            ),
          ],
        ),
      ),
    );
  }
}
