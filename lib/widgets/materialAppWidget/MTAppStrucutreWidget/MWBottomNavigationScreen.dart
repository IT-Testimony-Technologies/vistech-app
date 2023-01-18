import 'package:flutter/material.dart';
import 'package:vistech/main/components/AppListWidget.dart';
import 'package:vistech/main/utils/AppDataProvider.dart';

class MWBottomNavigationScreen extends StatefulWidget {
  static String tag = '/MWBottomNavigationScreen';

  @override
  MWBottomNavigationScreenState createState() => MWBottomNavigationScreenState();
}

class MWBottomNavigationScreenState extends State<MWBottomNavigationScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: AppListWidget(getBottomNavigationWidgetList())),
    );
  }
}
