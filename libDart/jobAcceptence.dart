import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Jobacceptance extends StatelessWidget {
  final cidd;
  final company;
  final jobtitle;
  final salary;
  const Jobacceptance(
      {Key key, this.cidd, this.company, this.jobtitle, this.salary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream:
          FirebaseFirestore.instance.collection('User').doc(cidd).snapshots(),
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
                    "Name: ",
                    style: TextStyle(
                      color: Color(0xFFfc6a26),
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    userDocument["name"],
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
                    "  Skills : ",
                    style: TextStyle(
                      color: Color(0xFFfc6a26),
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    userDocument["skills"],
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
                    "Qualification:",
                    style: TextStyle(
                      color: Color(0xFFfc6a26),
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    userDocument["qualification"],
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: FlatButton(
                color: Colors.black,
                textColor: Colors.white,
                padding: EdgeInsets.all(2.0),
                onPressed: () {
                  DocumentReference save = FirebaseFirestore.instance
                      .collection('Notification')
                      .doc(cidd);
                  // Call the user's CollectionReference to add a new user
                  return save
                      .set({
                        'jobtitile': jobtitle, // John Doe
                        'company': company, // Stokes and Sons
                        'salary': salary,
                        'message': 'You have been selected!'
                      })
                      .then((value) => print("User Added"))
                      .catchError(
                          (error) => print("Failed to add user: $error"));
                },
                child: Text(
                  "Accept",
                  style: TextStyle(fontSize: 17.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: FlatButton(
                color: Colors.black,
                textColor: Colors.white,
                padding: EdgeInsets.all(2.0),
                onPressed: () {
                  DocumentReference save = FirebaseFirestore.instance
                      .collection('Notification')
                      .doc(cidd);
                  // Call the user's CollectionReference to add a new user
                  return save
                      .set({
                        'jobtitile': jobtitle, // John Doe
                        'company': company, // Stokes and Sons
                        'salary': salary,
                        'message': 'Sorry You have not been selected.'
                      })
                      .then((value) => print("User Added"))
                      .catchError(
                          (error) => print("Failed to add user: $error"));
                },
                child: Text(
                  "Decline",
                  style: TextStyle(fontSize: 17.0),
                ),
              ),
            ),
          ],
        );
      },
    ));
  }
}
