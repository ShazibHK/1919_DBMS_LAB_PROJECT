import 'package:a/post_job.dart';
import 'package:a/read.dart';
import 'package:a/readprofile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'aplliedJobNotification.dart';
import 'home.dart';
import 'jobPostedList.dart';
import 'jobseeker_appliedjob.dart';
import 'jobseeker_savedjob.dart';
import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}

class Mainapp extends StatefulWidget {
  @override
  _Mainapp createState() => _Mainapp();
}

class _Mainapp extends State<Mainapp> {
  //here i'm going to place a list of image url

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xFFFCFCFC),
      //let's start by the appbar
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color(0xFFfcfcfc),
        title: Text(
          "Seek Job",
          style: TextStyle(
            color: Color(0xFFfc6a26),
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Postjob()),
              );
            },
          )
        ],
      ),

      body: Homepage(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 100,
              child: DrawerHeader(
                child: Text('Menu',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    )),
                decoration: BoxDecoration(
                  color: Color(0xFFfc6a26),
                ),
              ),
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReadInformation()),
                );
              },
            ),
            /*
            ListTile(
              title: Text('Saved Job'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JobSeekerSavedJob()),
                );
              },
            ),
            ListTile(
              title: Text('Applied Job'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => JobSeekerAppliedJob()),
                );
              },
            ),*/

            ListTile(
              title: Text('Job Posted'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Jobpostedlists()),
                );
              },
            ), /*
            ListTile(
              title: Text('Notification'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Notif()),
                );
              },
            ),*/
          ],
        ),
      ),
    );
  }
}
