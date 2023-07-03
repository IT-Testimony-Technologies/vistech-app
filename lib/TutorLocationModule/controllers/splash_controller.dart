import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:vistech/TutorLocationModule/views/register_screen.dart';

import '../views/login_screen.dart';
import '../views/search_screen.dart';

class SplashController extends FxController {
  @override
  String getTag() {
    return "splash_controller";
  }

  void goToSearchScreen() {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(builder: (context) => EstateSearchScreen()),
    );
  }

  void goToLogin() {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(builder: (context) => EstateLoginScreen()),
    );
  }

  void gotToHome() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EstateRegisterScreen()),
    );
  }
}
