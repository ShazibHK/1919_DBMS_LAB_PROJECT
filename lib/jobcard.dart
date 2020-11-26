import 'package:flutter/material.dart';

Widget jobcard() {
  return Center(
      child: Container(
    width: 350,
    height: 150,
    padding: new EdgeInsets.all(10.0),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      color: Color(0xFFfc6a26),
      elevation: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 8.0, left: 4, bottom: 8),
            child: Text(
              'Front End Developer',
              style: TextStyle(fontSize: 22.0, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0.0),
            child: Text(
              'Company:Yahoo',
              style: TextStyle(fontSize: 20.0, color: Colors.black),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 0.0),
              child: Text(
                'Salary:80000',
                style: TextStyle(fontSize: 20.0, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    ),
  ));
}
