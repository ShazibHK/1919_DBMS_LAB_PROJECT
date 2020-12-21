import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'jobAcceptence.dart';
import 'jobPostedList.dart';

String urid = '';
String ccid = '';
String userDocument = '';

class ProfileAppliedforjob extends StatefulWidget {
  final companyi;
  final descriptioni;
  final salaryi;
  final jobtitlei;
  const ProfileAppliedforjob({
    Key key,
    this.companyi,
    this.descriptioni,
    this.salaryi,
    this.jobtitlei,
  }) : super(key: key);

  @override
  _ProfileAppliedforjob createState() => _ProfileAppliedforjob();
}

class _ProfileAppliedforjob extends State<ProfileAppliedforjob> {
  var userDocument;
  @override
  Future<void> initState() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    urid = user.uid;
    super.initState();
  }

  CollectionReference users = FirebaseFirestore.instance
      .collection('postjob')
      .doc(urid)
      .collection('candidateid');
  DocumentReference profile =
      FirebaseFirestore.instance.collection('User').doc(ccid);
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
          userDocument = snapshot.data;
          return ListView(
            // ignore: deprecated_member_use
            children:
                // ignore: deprecated_member_use
                snapshot.data.documents.map((DocumentSnapshot document) {
              return new Center(
                  child: Container(
                height: 100,
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
                                  "Request-Id : ",
                                  style: TextStyle(
                                    color: Color(0xFFfc6a26),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  // ignore: deprecated_member_use
                                  document.data()['candidateid'],
                                  style: TextStyle(
                                    fontSize: 12,
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
                                ccid = document.data()['candidateid'];
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Jobacceptance(
                                        cidd: ccid,
                                        company: company,
                                        jobtitle: jobtitle,
                                        salary: salary),
                                    // Pass the arguments as part of the RouteSettings. The
                                    // DetailScreen reads the arguments from these settings.
                                  ),
                                );
                              },
                              child: Text(
                                "View Candidate Profile",
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
