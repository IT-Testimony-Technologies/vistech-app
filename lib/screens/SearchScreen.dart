import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vistech/screens/TutorScreen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Color randomColor() {
    var random = new Random();
    var next = random.nextInt(2);
    if (next == 0) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  int generateRandomRating() {
    final _random = new Random();
    return _random.nextInt(5) + 1;
  }

  List<String> imageUrls = [
    'https://pbs.twimg.com/profile_images/1588104627895107584/tipSaPN3_400x400.jpg',
    'https://pbs.twimg.com/media/Fl9U0O9aYAA3mKU?format=jpg&name=large',
    'https://pbs.twimg.com/profile_images/1613877082714701826/_Z3oBV6l_400x400.jpg',
    'https://pbs.twimg.com/profile_images/1585790681561415681/xek9guP9_400x400.jpg',
    'https://pbs.twimg.com/profile_images/1563200675521204224/gQqca_VQ_400x400.jpg',
    'https://pbs.twimg.com/profile_images/1603677304454012929/DIH5yJTI_400x400.jpg',
    'https://pbs.twimg.com/profile_images/1611507124315607042/a6mxTu9E_400x400.jpg',
    'https://pbs.twimg.com/media/Fl0d38nXEAA0AEV?format=jpg&name=medium',
    'https://pbs.twimg.com/profile_images/1603036811353358337/1vgn_Dxi_400x400.jpg',
    'https://pbs.twimg.com/media/Fmlp4Q0agAATjFP?format=jpg&name=small',
    'https://pbs.twimg.com/profile_images/1588104627895107584/tipSaPN3_400x400.jpg',
    'https://pbs.twimg.com/profile_images/1613787751442169858/qJHuP6EP_400x400.jpg',
    'https://pbs.twimg.com/profile_images/1183011023202029569/mNOTZ4Wt_400x400.jpg',
    'https://pbs.twimg.com/profile_images/1525274841460445185/5qJq3TmA_400x400.jpg',
    'https://pbs.twimg.com/profile_images/1387065127208247299/bni08CVZ_400x400.jpg',
    'https://pbs.twimg.com/profile_images/1599831054881374224/sx4KqXNX_400x400.jpg'
  ];
  String randomImages() {
    return imageUrls[Random().nextInt(imageUrls.length)];
  }

  late String _searchQuery;
  bool _noResults = false;
  _SearchScreenState() {
    _searchQuery = "";
  }

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
          onChanged: (value) {
            setState(() {
              _searchQuery = value;
            });
          },
          onSubmitted: (value) {
            setState(() {
              _searchQuery = "";
            });
          },
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Divider(),
      Expanded(
        child: _noResults
            ? Center(
                child: Text('No Results Found'),
              )
            : StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('tutors')
                    .where('name', isGreaterThanOrEqualTo: _searchQuery)
                    .snapshots(),
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (!streamSnapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final results = streamSnapshot.data?.docs;
                  //late String _randomImage = randomImages();
                  //late int _randomRating = generateRandomRating();
                  if (results!.isEmpty) {
                    setState(() {
                      _noResults = true;
                    });
                  }
                  return ListView.builder(
                    itemCount: results.length,
                    itemBuilder: (context, index) =>
                        // Row with tutor information here
                        InkWell(
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Container(
                              height: 80,
                              margin: EdgeInsets.only(bottom: 10),
                              child: Row(children: <Widget>[
                                SizedBox(width: 40),
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: new BoxDecoration(
                                    color: streamSnapshot.data?.docs[index]
                                            ['active']
                                        ? Colors.green
                                        : Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(randomImages()),
                                            fit: BoxFit.cover))),
                                SizedBox(width: 10),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => TutorScreen(
                                                  tutorname: streamSnapshot.data
                                                      ?.docs[index]['name'],
                                                  tutorprofileimage:
                                                      randomImages(),
                                                  tutorrating:
                                                      generateRandomRating(),
                                                )));
                                  },
                                  child: Text(
                                    "${streamSnapshot.data?.docs[index]['name']}",
                                  ),
                                ),
                                SizedBox(width: 10),
                                // Stars here
                                for (int i = 0; i < 5; i++)
                                  Icon(
                                    Icons.star,
                                    size: 15,
                                    color: i < generateRandomRating()
                                        ? Colors.yellow
                                        : Colors.grey,
                                  ),
                                SizedBox(width: 10),
                              ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    ]));
  }
}
