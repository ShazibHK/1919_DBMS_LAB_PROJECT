import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String name = '';
String description = '';
String skills = '';
String qualification = '';
String jobPosterId = '';
String uid;

// ignore: must_be_immutable
class ReadInformation extends StatefulWidget {
  @override
  _ReadInformation createState() => _ReadInformation();
}

class _ReadInformation extends State<ReadInformation> {
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
    return Scaffold(
        body: StreamBuilder(
      stream:
          FirebaseFirestore.instance.collection('User').doc(uid).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return new Text("Loading");
        }
        var userDocument = snapshot.data;

        return new ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(18),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      initialValue: userDocument['name'],
                      onChanged: (text) {
                        name = text;
                      },
                      keyboardType: TextInputType.multiline,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Name cannot be empty';
                        } else if (value.length < 2) {
                          return 'Name must be at least 3 characters long.';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Color(0xFFfc6a26)),
                        labelText: 'Name',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide:
                              BorderSide(width: 1, color: Color(0xFFfc6a26)),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      initialValue: userDocument['skills'],
                      onChanged: (text) {
                        skills = text;
                      },
                      keyboardType: TextInputType.multiline,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Skills cannot be empty';
                        } else if (value.length < 2) {
                          return 'Skills must be at least 3 characters long.';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Color(0xFFfc6a26)),
                        labelText: 'Skills',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide:
                              BorderSide(width: 1, color: Color(0xFFfc6a26)),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      initialValue: userDocument['qualification'],
                      onChanged: (text) {
                        qualification = text;
                      },
                      keyboardType: TextInputType.multiline,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'qualification cannot be empty';
                        } else if (value.length < 2) {
                          return 'qualification must be at least 3 characters long.';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Color(0xFFfc6a26)),
                        labelText: 'Qualification',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide:
                              BorderSide(width: 1, color: Color(0xFFfc6a26)),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      initialValue: userDocument['description'],
                      onChanged: (text) {
                        description = text;
                      },
                      keyboardType: TextInputType.multiline,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'description cannot be empty';
                        } else if (value.length < 2) {
                          return 'description must be at least 3 characters long.';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Color(0xFFfc6a26)),
                        labelText: 'Description',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide:
                              BorderSide(width: 1, color: Color(0xFFfc6a26)),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                  ),
                  Material(
                    elevation: 5,
                    color: Color(0xFFfc6a26),
                    borderRadius: BorderRadius.circular(32.0),
                    child: MaterialButton(
                      onPressed: update,
                      minWidth: 300.0,
                      height: 45.0,
                      child: Text(
                        "Update",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20.0),
                      ),
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

  Future<void> update() async {
    DocumentReference save =
        FirebaseFirestore.instance.collection('User').doc(uid);
    // Call the user's CollectionReference to add a new user
    return save
        .update({
          'skills': skills,
          'name': name, // Stokes and Sons
          'description': description,
          'qualification': qualification,
        })
        .then((value) => print("User Data Updated"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
