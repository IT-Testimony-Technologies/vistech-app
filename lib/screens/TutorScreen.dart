import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TutorScreen extends StatefulWidget {
  const TutorScreen(
      {Key? key,
      required this.tutorname,
      required this.tutorprofileimage,
      required this.tutorrating})
      : super(key: key);
  final String tutorname;
  final String tutorprofileimage;
  final int tutorrating;

  @override
  State<TutorScreen> createState() => _TutorScreenState();
}

class _TutorScreenState extends State<TutorScreen> {
  void paypremium() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    20.0,
                  ),
                ),
              ),
              contentPadding: EdgeInsets.only(
                top: 10.0,
              ),
              title: Text(
                "Confirm Premium Booking",
                style: TextStyle(fontSize: 14.0),
              ),
              content: Container(
                height: 400,
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Container(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blueAccent,
                              // fixedSize: Size(250, 50),
                            ),
                            onPressed: () {},
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 20,
                                ),
                                Text("Continue to PayPal"),
                                Icon(Icons.paypal_sharp),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    String _tutorname = widget.tutorname;

    return Scaffold(
      body: SafeArea(
        child: Dismissible(
          direction: DismissDirection.vertical,
          key: const Key('key'),
          onDismissed: (_) => Navigator.of(context).pop(),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("tutors")
                .where("name", isEqualTo: _tutorname)
                .snapshots(),
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
              return ListView.builder(
                itemCount: results!.length,
                itemBuilder: (context, index) => SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      // First row: Tutor's image
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(widget.tutorprofileimage),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Second row: Empty columns
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Container(
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(widget.tutorname),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "${streamSnapshot.data?.docs[index]['location']}",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    for (int i = 0; i < 5; i++)
                                      Icon(
                                        Icons.star,
                                        size: 15,
                                        color: i < widget.tutorrating
                                            ? Colors.yellow
                                            : Colors.grey,
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                          Expanded(
                              child: Container(
                            child: Column(
                              children: <Widget>[
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ChatScreen()));
                                    },
                                    child: Icon(Icons.chat,
                                        size: 40, color: Colors.blue)),
                              ],
                            ),
                          )),
                        ],
                      ),
                      // details row.
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Container(
                                    child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text("Status"),
                                    SizedBox(
                                      width: 10,
                                    ),
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
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "Premium Rate: \$${streamSnapshot.data?.docs[index]['premium_rate']}/hour",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    )
                                  ],
                                ),
                              ],
                            ))),
                          ],
                        ),
                      ),
                      // Third row: Join live session and join premium buttons
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                child: streamSnapshot.data?.docs[index]
                                        ['active']
                                    ? OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                            backgroundColor: Colors.green),
                                        child: Text("Join Live Session",
                                            style:
                                                TextStyle(color: Colors.white)),
                                        onPressed: () {},
                                      )
                                    : OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                            backgroundColor: Colors.red),
                                        child: Text("Join Live Session",
                                            style:
                                                TextStyle(color: Colors.white)),
                                        onPressed: () {},
                                      ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.blue),
                                  child: Text("Book Premium",
                                      style: TextStyle(color: Colors.white)),
                                  onPressed: () {
                                    paypremium();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<String> _messages = [];
  TextEditingController _textController = TextEditingController();
  bool _sendPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: Builder(
            builder: (context) => // Ensure Scaffold is in context
                IconButton(
                    icon: Icon(
                      Icons.keyboard_return_sharp,
                      color: Colors.white,
                    ),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.pop(context);
                    }),
          )),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                child: ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                margin: EdgeInsets.only(
                                    top: 10, bottom: 10, right: 10),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  border: Border.all(
                                    color: Colors.blue,
                                    width: 1,
                                  ),
                                ),
                                child: Text(_messages[index],
                                    style: TextStyle(color: Colors.white))),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        _sendPressed
                            ? Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          border: Border.all(
                                            color: Colors.greenAccent,
                                            width: 1,
                                          ),
                                        ),
                                        child: Text(
                                            "I am currently unavailable, but I will respond ASAP",
                                            style: TextStyle(
                                                fontSize: 8,
                                                color: Colors.white)),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : SizedBox(
                                height: 10,
                              ),
                      ],
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                margin: EdgeInsets.only(bottom: 20),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter your message",
                        ),
                        controller: _textController,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _messages.add(_textController.text);
                          _textController.clear();
                          _sendPressed = true;
                        });
                      },
                      child: Icon(Icons.send),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
