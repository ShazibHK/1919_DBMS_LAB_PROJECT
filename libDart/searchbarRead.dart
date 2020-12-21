import 'package:flutter/material.dart';

String uid;

// ignore: must_be_immutable
class Se1 extends StatefulWidget {
  @override
  _Se1 createState() => _Se1();
}

class _Se1 extends State<Se1> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView(
        children: [
          Container(
            height: 150,
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
                              "Job Title:",
                              style: TextStyle(
                                color: Color(0xFFfc6a26),
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              // ignore: deprecated_member_use
                              "Developer",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Row(
                          children: [
                            Text(
                              "Company:",
                              style: TextStyle(
                                color: Color(0xFFfc6a26),
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                            Text(
                              'Itech',
                              style: TextStyle(
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0),
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
                              " ₹ ",
                              style: TextStyle(
                                fontSize: 19,
                              ),
                            ),
                            Text(
                              '12000',
                              style: TextStyle(
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}
