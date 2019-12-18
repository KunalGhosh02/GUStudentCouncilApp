import 'package:flutter/material.dart';

class Faculty extends StatefulWidget {
  @override
  _FacultyState createState() => _FacultyState();
}

class _FacultyState extends State<Faculty> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          Text(
            "Faculty Info",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 5,
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: ListTile(
                leading: Icon(
                  Icons.watch_later,
                  size: 40,
                ),
                title: Text("Faculy Name"),
                subtitle: Text("Facuty Info"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
