import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
        backgroundColor: Colors.blue,
        title: const Text(
          "About Inkflow",
          style: TextStyle(
              fontFamily: 'Technoma',
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome to Inkflow!",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Technoma'),
              ),
              const SizedBox(height: 10),
              const Text(
                "Unleash your creativity with Inkflow, the app designed for doodlers, "
                "artists, and anyone who enjoys expressing themselves visually. "
                "Whether you’re looking to sketch a quick idea, pass time with creative "
                "fun, or explore your artistic side, Inkflow is here to help you capture "
                "your thoughts in visual form.",
                style: TextStyle(fontSize: 18, fontFamily: 'Technoma'),
              ),
              const SizedBox(height: 20),
              const Text(
                "Why I Created Inkflow",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Technoma'),
              ),
              const SizedBox(height: 10),
              const Text(
                "Inkflow is more than just an app—it’s a project close to my heart. "
                "Developed as a way to learn and explore Flutter, Inkflow represents "
                "my journey into app development. I’ve poured my passion into this app, "
                "and I hope you enjoy using it as much as I enjoyed building it.",
                style: TextStyle(fontSize: 18, fontFamily: 'Technoma'),
              ),
              const SizedBox(height: 20),
              const Text(
                "Key Features",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Technoma'),
              ),
              const SizedBox(height: 10),
              _buildFeature(Icons.brush, "Intuitive Drawing Tools",
                  "Easily accessible brushes, colors, and other tools for flexible sketching."),
              _buildFeature(Icons.aspect_ratio, "Customizable Canvas",
                  "Adjust canvas size and orientation for different types of projects."),
              _buildFeature(Icons.undo, "Undo/Redo Options",
                  "Experiment freely with the ability to undo or redo changes."),
              _buildFeature(Icons.save, "Save & Share",
                  "Save your creations and share them with friends or on social media."),
              const SizedBox(height: 20),
              const Text(
                "Made with Flutter",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Technoma'),
              ),
              const SizedBox(height: 10),
              const Text(
                "Inkflow was built using Flutter, a powerful toolkit for creating "
                "beautiful and fast mobile applications. This project allowed me to dive "
                "deep into Flutter concepts while crafting an app to bring a little "
                "creativity into users’ lives.",
                style: TextStyle(fontSize: 18, fontFamily: 'Technoma'),
              ),
              const SizedBox(
                height: 12,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/Running heart.gif')),
              const SizedBox(
                height: 12,
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  "Thank you for being a part of this journey!",
                  style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Technoma',
                      color: Colors.grey[700]),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeature(IconData icon, String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 28, color: Colors.blueAccent),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Technoma'),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(fontSize: 18, fontFamily: 'Technoma'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
