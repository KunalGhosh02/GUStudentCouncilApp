import 'package:flutter/material.dart';
import 'package:gusc/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  final loginController = TextEditingController();
  final passWordControlller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    loginController.dispose();
    passWordControlller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Column(
          children: <Widget>[
            TextField(
              controller: loginController,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: passWordControlller,
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              color: Colors.red,
              child: Text("Sign in"),
              onPressed: () async {
                await _auth.signInWithEmail(
                    loginController.text, passWordControlller.text);
              },
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              child: Text("Sign Up"),
              onPressed: () {
                setState(() {
                  Navigator.pushNamed(context, '/signup');
                });
              },
            )
          ],
        ));
  }
}
