import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vistech/screens/MenuScreen.dart';
import 'package:vistech/screens/SearchScreen.dart';
import 'package:vistech/screens/SettingScreen.dart';
import 'package:vistech/screens/ShoppingScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static Future<User?> getCurrentUser() async {
    return await FirebaseAuth.instance.currentUser;
  }

  String? uid, name;
  @override
  void initState() {
    super.initState();
    getCurrentUser().then((user) {
      setState(() {
        uid = user?.uid;
        name = user?.displayName;
      });
    });
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    MenuScreen(),
    SearchScreen(),
    ShoppingScreen(),
    SettingScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (context) => // Ensure Scaffold is in context
                IconButton(
                    icon: Icon(
                      Icons.account_circle,
                      color: Colors.blue,
                    ),
                    color: Colors.black,
                    onPressed: () => Scaffold.of(context).openDrawer()),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Text(''),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                        image: AssetImage("assets/DrawerHeader.png"),
                        fit: BoxFit.cover)),
              ),
              ListTile(
                title: Text('Welcome $name'),
                onTap: () {
                  // handle the press event
                },
              ),
              Divider(),
              ListTile(
                title: Text('Share App'),
                onTap: () {
                  // handle the press event
                },
              ),
              Divider(),
              ListTile(
                title: Text('Sign Out'),
                onTap: () {
                  // handle the press event
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: const TextStyle(color: Colors.blue, fontSize: 14),
          showSelectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.blue),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.blue,
              ),
              label: 'Search a Tutor',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_shopping_cart,
                color: Colors.blue,
              ),
              label: 'Shopping',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.blue),
              label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
