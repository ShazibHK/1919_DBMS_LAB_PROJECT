import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'main.dart';

class Seekprofiledata extends StatefulWidget {
  @override
  _Seekprofiledata createState() => _Seekprofiledata();
}

class _Seekprofiledata extends State<Seekprofiledata> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _skills = TextEditingController();
  final _qualification = TextEditingController();
  final _description = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _skills.dispose();
    _description.dispose();
    _qualification.dispose();
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
                controller: _name,
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
                controller: _skills,
                keyboardType: TextInputType.multiline,
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Skills cannot be empty';
                  } else if (value.length < 0) {
                    return 'Skills must be at least 3 characters long.';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Color(0xFFfc6a26)),
                  labelText: 'Skills',
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
                controller: _qualification,
                keyboardType: TextInputType.multiline,
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Qualification cannot be empty';
                  } else if (value.length < 0) {
                    return 'Qualification must be at least 3 characters long.';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Color(0xFFfc6a26)),
                  labelText: 'Qualification',
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
          ],
        ),
      ),
    );
  }
}
