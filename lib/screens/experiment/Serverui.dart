import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ServerUI extends StatefulWidget {
  const ServerUI({Key? key}) : super(key: key);

  @override
  State<ServerUI> createState() => _ServerUIState();
}

class _ServerUIState extends State<ServerUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // Retrieve the data from Firestore
            StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection("widgets").snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (!streamSnapshot.hasData) {
                  return Center(
                    child: Container(
                      height: 20,
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    ),
                  );
                }
                final results = streamSnapshot.data?.docs;
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10,
                    ),
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: results?.length,
                    itemBuilder: (context, index) => Column(
                          children: <Widget>[
                            Container(
                                child: Text(
                                    "${streamSnapshot.data?.docs[index]['title']}")),
                            Divider(),
                            Divider(),
                            Container(
                                child: Text(
                                    "{${streamSnapshot.data?.docs[index]['description']}"))
                          ],
                        ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MyWidget {
  final String code;
  final String title;
  final String description;

  MyWidget(
      {required this.code, required this.title, required this.description});
}
