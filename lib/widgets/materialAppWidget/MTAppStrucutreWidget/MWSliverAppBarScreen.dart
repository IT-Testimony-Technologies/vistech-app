import 'package:flutter/material.dart';
import 'package:vistech/main/components/AppListWidget.dart';
import 'package:vistech/main/utils/AppDataProvider.dart';

class MWSliverAppBarScreen extends StatefulWidget {
  static String tag = '/MWSliverAppBarScreen';

  @override
  MWSliverAppBarScreenState createState() => MWSliverAppBarScreenState();
}

class MWSliverAppBarScreenState extends State<MWSliverAppBarScreen> {
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
    return Scaffold(body: AppListWidget(getSliverAppBarWidgetList()));
  }
}
