import 'package:flutter/material.dart';
import 'package:vistech/screens/StartScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => StartScreen()));
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Image.asset(
            'assets/splashscreen.jpg',
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}
