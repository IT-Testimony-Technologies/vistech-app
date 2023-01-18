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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Divider(),
              SizedBox(
                height: 30,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 40,
                  ),
                  Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://pbs.twimg.com/media/Fmq-dHFWIAADEsZ?format=jpg&name=medium'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  // icon: Icon(Icons.play_arrow),
                  Container(
                    color: Colors.blue,
                    width: 200,
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.play_arrow),
                          onPressed: () {
                            // Play the course
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text('Expert'),
                      Text('Beginner'),
                      Text('Intermediate'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
