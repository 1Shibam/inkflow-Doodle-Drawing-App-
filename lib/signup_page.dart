import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Signup Page",
          style: TextStyle(
              fontFamily: 'Digital', fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0).copyWith(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Create an Account",
              style: TextStyle(
                fontFamily: 'Digital',
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            // Name TextField
            TextField(
              style: TextStyle(fontFamily: 'Digital', fontSize: 20),
              decoration: InputDecoration(
                labelText: "Name",
                labelStyle: TextStyle(
                    fontFamily: 'Digital',
                    fontSize: 20,
                    color: Colors.black.withOpacity(0.5)),
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(height: 16),

            // Age TextField
            TextField(
              style: TextStyle(fontFamily: 'Digital', fontSize: 20),
              decoration: InputDecoration(
                labelText: "Age",
                labelStyle: TextStyle(
                    fontFamily: 'Digital',
                    fontSize: 20,
                    color: Colors.black.withOpacity(0.5)),
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.calendar_today,
                  color: Colors.blue,
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),

            // Email TextField
            TextField(
              style: TextStyle(fontFamily: 'Digital', fontSize: 20),
              decoration: InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(
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
            SizedBox(height: 16),

            // Password TextField
            TextField(
              style: TextStyle(fontFamily: 'Digital', fontSize: 20),
              decoration: InputDecoration(
                labelText: "Password",
                labelStyle: TextStyle(
                    fontFamily: 'Digital',
                    fontSize: 20,
                    color: Colors.black.withOpacity(0.5)),
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.blue,
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 28),

            // Submit Button
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blue)),
              onPressed: () {
                // Handle the submit action
              },
              child: Text(
                "Sign Up",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
