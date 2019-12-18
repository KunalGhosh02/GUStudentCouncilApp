import 'package:flutter/material.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          Text(
            "Hi there, \$_user",
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
                title: Text("Upcoming events"),
                subtitle: Text("Placeholder"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
