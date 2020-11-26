/// Flutter code sample for SingleChildScrollView

// In this example, the children are spaced out equally, unless there's no more
// room, in which case they stack vertically and scroll.
//
// When using this technique, [Expanded] and [Flexible] are not useful, because
// in both cases the "available space" is infinite (since this is in a viewport).
// The next section describes a technique for providing a maximum height constraint.

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'foodcart.dart';
import 'form.dart';
import 'jobcard.dart';

/// This is the stateless widget that the main application instantiates.
class Homepage extends StatelessWidget {
  Homepage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyText2,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                    child: Column(
                      children: [
                        Text(
                          "Let's Search a\nJob for You.",
                          style: TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.0, vertical: 5.0),
                    child: Container(
                      width: double.infinity,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Color(0x55d2d2d2),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search... ",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 20.0),
                            ),
                          )),
                          RaisedButton(
                            elevation: 3.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Forms()),
                              );
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              child: Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                            ),
                            color: Color(0xFFfc6a26),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.0, vertical: 0.0),
                    child: Container(
                        margin: EdgeInsets.only(left: 3, right: 3.0),
                        padding:
                            EdgeInsets.symmetric(horizontal: .0, vertical: 6.0),
                        child: Row(
                          children: <Widget>[
                            Container(width: 6),
                            Chip(
                              padding: const EdgeInsets.all(1.0),
                              label: Text("Full Time",
                                  style: TextStyle(color: Colors.white)),
                              elevation: 2.0,
                              backgroundColor: Color(0xFFfc6a26),
                            ),
                            Container(width: 6),
                            Chip(
                              padding: const EdgeInsets.all(1.0),
                              label: Text("Part Time",
                                  style: TextStyle(color: Colors.white)),
                              elevation: 2.0,
                              backgroundColor: Color(0xFFfc6a26),
                            ),
                            Container(width: 6),
                            Chip(
                              padding: const EdgeInsets.all(1.0),
                              label: Text("Internship",
                                  style: TextStyle(color: Colors.white)),
                              elevation: 2.0,
                              backgroundColor: Color(0xFFfc6a26),
                            ),
                            Container(width: 6),
                            Chip(
                              padding: const EdgeInsets.all(1.0),
                              label: Text("Contract",
                                  style: TextStyle(color: Colors.white)),
                              elevation: 2.0,
                              backgroundColor: Color(0xFFfc6a26),
                            ),
                          ],
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        Lottie.asset('assets/a.json'),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.0, vertical: 6.0),
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            "Suggestions for you",
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            "View All ",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 34.0, vertical: 5.0),
                    child: Column(
                      children: [
                        Container(
                          child: SizedBox(
                            width: 220.0,
                            height: 6.0,
                            child: DecoratedBox(
                                decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Color(0xFFfc6a26),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 19.0, vertical: 0.0),
                    child: Column(
                      children: [
                        Container(
                          height: 200.0,
                          child: ListView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              jobcard(),
                              jobcard(),
                              jobcard(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
