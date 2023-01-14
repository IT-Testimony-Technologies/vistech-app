import 'package:flutter/material.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key}) : super(key: key);

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  final List<String> courseContents = [
    'Lesson 1: Introduction to the Piano',
    'Lesson 2: Understanding the Keyboard',
    'Lesson 3: Playing Basic Chords',
    'Lesson 4: Reading Sheet Music',
    'Lesson 5: Playing Melodies',
    'Lesson 6: Advanced Techniques',
    'Lesson 7: Playing Popular Songs',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Hero(
            tag: "courseImage",
            child: Image.asset(
              'assets/splashscreen.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: courseContents.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(courseContents[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
    ;
  }
}
