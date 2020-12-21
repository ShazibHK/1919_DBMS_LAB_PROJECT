import 'package:a/seek_profile_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'login.dart';

class Signup extends StatefulWidget {
  @override
  _Forms createState() => _Forms();
}

class _Forms extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final pass = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool showProgress = false;

  bool _isSuccess;

  @override
  void dispose() {
    email.dispose();
    pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 50.0,
          horizontal: 10.0,
        ),
        child: _buildForm(),
      ),
    );
  }

  Form _buildForm() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 2.0),
                    child: Text('Job Seek',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 60.0, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 200.0,
              height: 8.0,
              child: DecoratedBox(
                  decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Color(0xFFfc6a26),
              )),
            ),
            SizedBox(
              width: 300.0,
              height: 300.0,
              child: Lottie.asset('assets/yoga.json'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: email,
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
                  labelText: 'em@il',
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
                controller: pass,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'password cannot be empty';
                  } else if (value.length < 7) {
                    return 'password must be at least 8 characters long.';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Color(0xFFfc6a26)),
                  labelText: 'password',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(width: 1, color: Color(0xFFfc6a26)),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
            ),
            SizedBox(height: 40.0),
            Material(
              elevation: 5,
              color: Color(0xFFfc6a26),
              borderRadius: BorderRadius.circular(32.0),
              child: MaterialButton(
                onPressed: () async {
                  setState(() {
                    showProgress = true;
                  });
                  try {
                    final newuser = await _auth.createUserWithEmailAndPassword(
                        email: email.text, password: pass.text);
                    if (newuser != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Enterdata()),
                      );
                      setState(() {
                        showProgress = false;
                      });
                    }
                  } catch (e) {}
                },
                minWidth: 300.0,
                height: 45.0,
                child: Text(
                  "Register",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                ),
              ),
            ),
            SizedBox(height: 15.0),
            SizedBox(height: 15.0),
            Container(
              height: 53.0,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: 1.0),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20.0)),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                child: Center(
                  child: Text('Go Back',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
/*
  void _signup() {
    _auth
        .createUserWithEmailAndPassword(email: email.text, password: pass.text)
        .then((result) {})
        .catchError((err) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(err.message),
              actions: [
                FlatButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
  }*/
}
