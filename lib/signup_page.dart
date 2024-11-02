import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(100, 50), // Set width and height here
                backgroundColor: Colors.blue, // Set the background color
              ),
              onPressed: () {
                // Handle the submit action
              },
              child: Text(
                "Sign Up",
                style: TextStyle(
                  fontFamily: 'Digital',
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ),

            // Submit Button

            SizedBox(
              height: 16,
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
                      icon: SvgPicture.asset('assets/images/google.svg'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
