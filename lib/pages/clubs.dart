import 'package:flutter/material.dart';

class Clubs extends StatefulWidget {
  @override
  _ClubsState createState() => _ClubsState();
}

class _ClubsState extends State<Clubs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          Text(
            "Clubs",
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
                title: Text("Club 1"),
                subtitle: Text("Placeholder Desc"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
