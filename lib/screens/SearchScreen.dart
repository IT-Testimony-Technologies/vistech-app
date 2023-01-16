import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.blue, width: 2.0),
            ),
            hintText: 'Search for a tutor',
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // handle search submit
              },
            ),
          ),
        ),
      )
    ]));
  }
}
