import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: GridView.count(crossAxisCount: 2, children: <Widget>[
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.add,
                  color: Colors.green,
                  size: 40,
                ),
                SizedBox(height: 10),
                Text(
                  "Courses",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.search,
                  color: Colors.green,
                  size: 40,
                ),
                SizedBox(height: 10),
                Text(
                  "Find a Tutor",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.manage_accounts,
                  color: Colors.green,
                  size: 40,
                ),
                SizedBox(height: 10),
                Text(
                  "Learn with Ai",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.settings,
                  color: Colors.green,
                  size: 40,
                ),
                SizedBox(height: 10),
                Text(
                  "Settings",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
