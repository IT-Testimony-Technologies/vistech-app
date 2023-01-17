import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vistech/screens/CourseScreen.dart';
import 'package:vistech/screens/SearchScreen.dart';
import 'package:vistech/screens/ShoppingScreen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Divider(color: Colors.black),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchScreen()));
                      },
                      child: Text(
                        "Top Tutors in your area",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 200,
                        //width: double.infinity,
                        child: new GoogleMap(
                          mapType: MapType.normal,
                          initialCameraPosition: CameraPosition(
                            target: LatLng(37.4219999, -122.0840575),
                            zoom: 15,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            Divider(
              color: Colors.black,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Top Courses",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: screenHeight * 0.3,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: <Widget>[
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://pbs.twimg.com/media/FgLoWrvWYAAy1Yk?format=jpg&name=900x900"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.piano,
                                color: Colors.white,
                              ),
                              Text(
                                "Piano Course",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CourseScreen(),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://pbs.twimg.com/media/FhqLvatWIAA6rJC?format=jpg&name=medium"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.play_circle_fill,
                                color: Colors.white,
                              ),
                              Text(
                                "Guitar Course",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CourseScreen(),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://pbs.twimg.com/media/FdxqYzIXoAA6o1y?format=jpg&name=large"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.mic,
                                color: Colors.white,
                              ),
                              Text(
                                "Vocal course",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CourseScreen(),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://media.istockphoto.com/id/1044688970/photo/drums-on-stage.jpg?s=612x612&w=0&k=20&c=VpUCgqdnOU7X3jiwNK3qBeq33uo29m2Fu3n7x2Q9IAY="),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.view_column_outlined,
                                color: Colors.white,
                              ),
                              Text(
                                "Drums Course",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CourseScreen(),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ]),
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.black,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              //width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 300,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Last Quiz Result : 20%",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Expanded(
                              child: SizedBox(
                            height: 2,
                            child: LinearProgressIndicator(
                              value: 0.2,
                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.blue,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: TextButton.icon(
                                icon: Icon(
                                  Icons.shop,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  "Shop with Wimbo",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  // handle the press event
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ShoppingScreen()));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.black,
            ),
          ]),
        ),
      ),
    );
  }
}
