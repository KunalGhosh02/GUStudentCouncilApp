import 'package:flutter/material.dart';
import 'package:gusc/services/auth.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();
  final signUpEmailController = TextEditingController();
  final signUpPasswordConroller = TextEditingController();
  String email = '';
  String password = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    signUpEmailController.dispose();
    signUpPasswordConroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: signUpEmailController,
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: signUpPasswordConroller,
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
              child: Text("Sign Up"),
              onPressed: () async {
                try {
                  await _auth.signUpWithEmail(
                      signUpEmailController.text, signUpPasswordConroller.text);
                } catch (e) {
                  print(e);
                } finally {
                  Navigator.pop(context);
                }
              }),
          RaisedButton(
            child: Text("Sign in"),
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            },
          ),
        ],
      ),
    );
  }
}
