import 'package:flutter/material.dart';
import 'package:gusc/services/auth.dart';

class Settings extends StatelessWidget {
  final AuthService mAuthService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: Container(
          child: RaisedButton(
            child: Text("Sign out"),
            onPressed: () async {
              await mAuthService.signOut();
              Navigator.pop(context);
            },
          ),
        ));
  }
}
