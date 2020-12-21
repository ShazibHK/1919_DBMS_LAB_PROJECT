import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final User user = auth.currentUser;
final uid = user.uid;
String company = '';
String description = '';
String salary = '';
String jobtitle = '';
String jobPosterId = '';

class DetailScreen extends StatelessWidget {
  final doc;
  final uid;
  const DetailScreen({Key key, this.doc, this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream:
          FirebaseFirestore.instance.collection('postjob').doc(doc).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return new Text("Loading");
        }
        var userDocument = snapshot.data;

        //return new Text(userDocument["name"]);
        return new ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(18),
              child: Row(
                children: [
                  Text(
                    "Job Title : ",
                    style: TextStyle(
                      color: Color(0xFFfc6a26),
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    userDocument["jobtitle"],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 24, bottom: 8),
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
                    userDocument["company"],
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, top: 10, bottom: 10.0),
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
                    userDocument["salary"],
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.only(left: 24.0, top: 10, bottom: 10.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 14),
                      child: FlatButton(
                        color: Colors.black,
                        textColor: Colors.white,
                        padding: EdgeInsets.all(2.0),
                        onPressed: () {
                          jobtitle = userDocument["jobtitle"];
                          company = userDocument["company"];
                          salary = userDocument["salary"];
                          description = userDocument["description"];
                          jobPosterId = userDocument["uid"];
                          CollectionReference save = FirebaseFirestore.instance
                              .collection('save')
                              .doc(uid)
                              .collection("jobsaved");
                          // Call the user's CollectionReference to add a new user
                          return save
                              .add({
                                'jobtitile': jobtitle, // John Doe
                                'company': company, // Stokes and Sons
                                'salary': salary,
                                'description': description,
                              })
                              .then((value) => print("User Added"))
                              .catchError((error) =>
                                  print("Failed to add user: $error"));
                        },
                        child: Text(
                          "Save",
                          style: TextStyle(fontSize: 17.0),
                        ),
                      ),
                    ),
                    FlatButton(
                      color: Colors.black,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(8.0),
                      onPressed: () async {
                        final User userid = auth.currentUser;
                        final uid = userid.uid;

                        jobtitle = userDocument["jobtitle"];
                        company = userDocument["company"];
                        salary = userDocument["salary"];
                        description = userDocument["description"];

                        //for job seeker
                        CollectionReference applyjob = FirebaseFirestore
                            .instance
                            .collection('apply')
                            .doc(uid)
                            .collection("applyjob");
                        // Call the user's CollectionReference to add a new user
                        return applyjob
                            .add({
                              'jobtitile': jobtitle, // John Doe
                              'company': company, // Stokes and Sons
                              'salary': salary,
                              'description': description,
                            })
                            .then((value) => jobapplyposter())
                            .catchError(
                                (error) => print("Failed to add user: $error"));
                        //for job poster
                      },
                      child: Text(
                        "Apply for job",
                        style: TextStyle(fontSize: 17.0),
                      ),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, top: 10, bottom: 10.0),
              child: Text(
                userDocument["description"],
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            )
          ],
        );
      },
    ));
  }

  void a() {}

  Future<void> jobapplyposter() async {
    DocumentReference save = FirebaseFirestore.instance
        .collection('postjob')
        .doc(jobPosterId)
        .collection("candidateid")
        .doc(uid);

    // Call the user's CollectionReference to add a new user
    return save
        .set({
          'candidateid': uid,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
