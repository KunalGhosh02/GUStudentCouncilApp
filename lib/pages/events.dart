import 'package:flutter/material.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          Text(
            "Core events",
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
                title: Text("An awesome event"),
                subtitle: Text("By TechnoJam"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
