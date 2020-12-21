import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String nnuid = '';

class Notif extends StatefulWidget {
  @override
  _Notif createState() => _Notif();
}

class _Notif extends State<Notif> {
  @override
  Future<void> initState() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    nnuid = user.uid;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('Notification')
          .doc(nnuid)
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
                    "Company: ",
                    style: TextStyle(
                      color: Color(0xFFfc6a26),
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    userDocument["company"],
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
                    "Jobt Title:",
                    style: TextStyle(
                      color: Color(0xFFfc6a26),
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    userDocument["jobtitile"],
                    style: TextStyle(
                      fontSize: 17,
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
                    "Salary:",
                    style: TextStyle(
                      color: Color(0xFFfc6a26),
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
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
              padding: const EdgeInsets.only(left: 24, top: 24, bottom: 8),
              child: Row(
                children: [
                  Text(
                    "Notice:",
                    style: TextStyle(
                      color: Color(0xFFfc6a26),
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    userDocument["message"],
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    ));
  }
}
