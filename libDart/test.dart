import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
String curuid = '';
String company = '';
String description = '';
String salary = '';
String jobtitle = '';
String cid = '';

//
class Ta extends StatefulWidget {
  @override
  _Ta createState() => _Ta();
}

class _Ta extends State<Ta> {
  @override
  Future<void> initState() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    curuid = user.uid;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('postjob')
          .doc(curuid)
          .collection("candidateid")
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return new Text("Loading");
        }
        //var userDocument = snapshot.data;
        cid = snapshot.data["candidateid"];

        //sub stream builder to fetch job appllier details

        return StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('User')
              .doc(cid)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return new Text("Loading");
            }
            var cDocument = snapshot.data;

            return new ListView(
              // ignore: deprecated_member_use
              children:
                  snapshot.data.documents.map((DocumentSnapshot document) {
                return new Center(
                    child: Container(
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
                          //var doc = document.documentID;
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 14, left: 14.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Name: ",
                                    style: TextStyle(
                                      color: Color(0xFFfc6a26),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    // ignore: deprecated_member_use
                                    cDocument['name'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 14, left: 14.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Skills: ",
                                    style: TextStyle(
                                      color: Color(0xFFfc6a26),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    // ignore: deprecated_member_use
                                    cDocument['skills'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 14, left: 14.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Qualification: ",
                                    style: TextStyle(
                                      color: Color(0xFFfc6a26),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    // ignore: deprecated_member_use
                                    cDocument['qualification'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 14, left: 14.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Desciption: ",
                                    style: TextStyle(
                                      color: Color(0xFFfc6a26),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    // ignore: deprecated_member_use
                                    cDocument['desciption'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
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
      },
    ));
  }
}
