import 'package:flutter/material.dart';

class ListP extends StatefulWidget {
  _ListP createState() => _ListP();
}

class _ListP extends State<ListP> {
  @override
  Widget build(BuildContext context) {
    return Container(
        // ignore: missing_return
        child: FutureBuilder(builder: (_, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: Text("Loading"),
        );
      } else {}
    }));
  }
}

class Detailp extends StatefulWidget {
  _Detailp createState() => _Detailp();
}

class _Detailp extends State<Detailp> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
