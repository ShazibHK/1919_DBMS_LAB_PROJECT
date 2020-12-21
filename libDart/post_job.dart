import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'main.dart';

String uid;

class Postjob extends StatefulWidget {
  @override
  _Postjob createState() => _Postjob();
}

class _Postjob extends State<Postjob> {
  final _formKey = GlobalKey<FormState>();
  final _jobtitle = TextEditingController();
  final _company = TextEditingController();
  final _salary = TextEditingController();
  final _description = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Future<void> initState() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;

    uid = user.uid;
    super.initState();
  }

  @override
  void dispose() {
    _jobtitle.dispose();
    _company.dispose();
    _description.dispose();
    _salary.dispose();
    super.dispose();
  }

  // Option
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 70.0,
          horizontal: 10.0,
        ),
        child: _buildForm(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFfc6a26),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Mainapp()),
          );
        },
        child: Icon(Icons.done),
      ),
    );
  }

  Form _buildForm() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: Text(
                "Complete Your Profile",
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              width: 140.0,
              height: 8.0,
              child: DecoratedBox(
                  decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Color(0xFFfc6a26),
              )),
            ),
            SizedBox(
              width: 100.0,
              height: 100.0,
              child: Lottie.asset('assets/Formfill.json'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _jobtitle,
                keyboardType: TextInputType.multiline,
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Job Title cannot be empty';
                  } else if (value.length < 2) {
                    return 'Job Title must be at least 3 characters long.';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Color(0xFFfc6a26)),
                  labelText: 'Job Title',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(width: 1, color: Color(0xFFfc6a26)),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _company,
                keyboardType: TextInputType.multiline,
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Company name cannot be empty';
                  } else if (value.length < 0) {
                    return 'Company name must be at least 3 characters long.';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Color(0xFFfc6a26)),
                  labelText: 'Company Name',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(width: 1, color: Color(0xFFfc6a26)),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _salary,
                keyboardType: TextInputType.multiline,
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Salary cannot be empty';
                  } else if (value.length < 0) {
                    return 'Salary must be at least 3 characters long.';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Color(0xFFfc6a26)),
                  labelText: 'Salary',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(width: 1, color: Color(0xFFfc6a26)),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _description,
                keyboardType: TextInputType.multiline,
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Description cannot be empty';
                  } else if (value.length < 0) {
                    return 'Description must be at least 0 characters long.';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Color(0xFFfc6a26)),
                  labelText: 'Description',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(width: 1, color: Color(0xFFfc6a26)),
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
                onPressed: submit,
                minWidth: 300.0,
                height: 45.0,
                child: Text(
                  "Submit",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> submit() async {
    DocumentReference user =
        FirebaseFirestore.instance.collection('postjob').doc(uid);
    // Call the user's CollectionReference to add a new user
    return user
        .set({
          'jobtitle': _jobtitle.text, // John Doe
          'company': _company.text, // Stokes and Sons
          'description': _description.text,
          'salary': _salary.text,
          'uid': uid,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
