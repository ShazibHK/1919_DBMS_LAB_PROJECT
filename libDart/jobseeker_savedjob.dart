import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

String uid;

class JobSeekerSavedJob extends StatefulWidget {
  @override
  _JobSeekerSavedJob createState() => _JobSeekerSavedJob();
}

class _JobSeekerSavedJob extends State<JobSeekerSavedJob> {
  String doc;

  @override
  Future<void> initState() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    uid = user.uid;
    super.initState();
  }

  CollectionReference users = FirebaseFirestore.instance
      .collection('save')
      .doc(uid)
      .collection('jobsaved');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: users.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return ListView(
            // ignore: deprecated_member_use
            children: snapshot.data.documents.map((DocumentSnapshot document) {
              return new Center(
                  child: Container(
                height: 250,
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
                      onTap: () {},
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
                                  document.data()['jobtitile'],
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
                          Padding(
                            padding: const EdgeInsets.only(right: 14),
                            child: FlatButton(
                              color: Colors.black,
                              textColor: Colors.white,
                              padding: EdgeInsets.all(2.0),
                              onPressed: () {
                                // ignore: deprecated_member_use
                                var doc = document.documentID;
                                return users
                                    .doc(doc)
                                    .delete()
                                    .then((value) => print("User Deleted"))
                                    .catchError((error) =>
                                        print("Failed to delete user: $error"));
                              },
                              child: Text(
                                "Unsave",
                                style: TextStyle(fontSize: 17.0),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ));
            }).toList(),
          );
        },
      ),
    );
  }
}
