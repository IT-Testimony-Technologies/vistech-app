import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vistech/screens/HomeScreen.dart';
import 'package:vistech/screens/StartScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    Future.delayed(Duration(seconds: 6), () {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => StartScreen()));
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        }
      });
    });
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Center(
          child: Image.asset(
            'assets/splashscreenicon.PNG',
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}
