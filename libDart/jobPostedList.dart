import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:a/test.dart';
import 'profileAppliedForJob.dart';

String jobtitle = '';
String company = '';
String salary = '';
String description = '';
String uidd;

class Jobpostedlists extends StatefulWidget {
  @override
  _Jobpostedlists createState() => _Jobpostedlists();
}

class _Jobpostedlists extends State<Jobpostedlists> {
  String doc;

  @override
  Future<void> initState() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    uidd = user.uid;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('postjob')
          .doc(uidd)
          .snapshots(),
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
              padding: const EdgeInsets.only(left: 24.0, top: 10, bottom: 10.0),
              child: Row(
                children: [
                  Text(
                    "  Description       :",
                    style: TextStyle(
                      color: Color(0xFFfc6a26),
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    userDocument["description"],
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
            FlatButton(
              color: Colors.black,
              textColor: Colors.white,
              padding: EdgeInsets.all(15.0),
              onPressed: () async {
                jobtitle = userDocument["jobtitle"];
                company = userDocument["company"];
                salary = userDocument["salary"];
                description = userDocument["description"];
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileAppliedforjob(
                        companyi: company,
                        jobtitlei: jobtitle,
                        salaryi: salary,
                        descriptioni: description),
                    // Pass the arguments as part of the RouteSettings. The
                    // DetailScreen reads the arguments from these settings.
                  ),
                );
              },
              child: Text(
                "See Applied Profile",
                style: TextStyle(fontSize: 17.0),
              ),
            ),
          ],
        );
      },
    ));
  }
}
