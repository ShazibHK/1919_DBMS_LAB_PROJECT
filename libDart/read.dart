import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'jobDetaildescription.dart';

String uid;

// ignore: must_be_immutable
class UserInformation extends StatefulWidget {
  @override
  _UserInformation createState() => _UserInformation();
}

class _UserInformation extends State<UserInformation> {
  String doc;
  @override
  Future<void> initState() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    uid = user.uid;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('postjob');

    return StreamBuilder<QuerySnapshot>(
      stream: users.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return new ListView(
          // ignore: deprecated_member_use
          children: snapshot.data.documents.map((DocumentSnapshot document) {
            return new Center(
                child: Container(
              height: 150,
              padding: new EdgeInsets.all(10.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                color: Colors.orange[50],
                elevation: 2,
                child: new InkWell(
                    onTap: () {
                      // ignore: deprecated_member_use
                      var doc = document.documentID;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(doc: doc, uid: uid),
                          // Pass the arguments as part of the RouteSettings. The
                          // DetailScreen reads the arguments from these settings.
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 14, left: 14.0),
                          child: Row(
                            children: [
                              Text(
                                "Job Title : ",
                                style: TextStyle(
                                  color: Color(0xFFfc6a26),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                // ignore: deprecated_member_use
                                document.data()['jobtitle'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Row(
                            children: [
                              Text(
                                "  Company : ",
                                style: TextStyle(
                                  color: Color(0xFFfc6a26),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                document.data()['company'],
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 14.0),
                          child: Row(
                            children: [
                              Text(
                                "  Salary       :",
                                style: TextStyle(
                                  color: Color(0xFFfc6a26),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                " ₹ ",
                                style: TextStyle(
                                  fontSize: 19,
                                ),
                              ),
                              Text(
                                document.data()['salary'],
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            ));
          }).toList(),
        );
      },
    );
  }
}
