import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gusc/services/auth.dart';
import 'package:url_launcher/url_launcher.dart';

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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Material(
                elevation: 4,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.elliptical(470, 300)),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 330,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Colors.yellow[700], Colors.amber[200]]),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.elliptical(470, 300))),
                  child: Stack(children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 30, top: 50),
                      child: Container(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: 100,
                            width: 100,
                            child: Image.asset('lib/assets/logos/gu.png'),
                          )),
                    ),
                    Column(children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 30, top: 40),
                        child: Container(
                            alignment: Alignment.topRight,
                            child: Text(
                              "Galgotias University Student Council",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width < 400
                                          ? 17
                                          : 23,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 30, top: 10),
                        child: Container(
                            alignment: Alignment.topRight,
                            child: Text(
                              "Sign In",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            )),
                      ),
                    ])
                  ]),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Material(
                  elevation: 2,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 20, right: 10, top: 5, bottom: 5),
                    height: 60,
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        bottomLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Email",
                        icon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                        border: InputBorder.none,
                      ),
                      controller: loginController,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Material(
                  elevation: 2,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 20, right: 10, top: 5, bottom: 5),
                    height: 60,
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                    ),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                        icon: Icon(
                          Icons.vpn_key,
                          color: Colors.black,
                        ),
                        border: InputBorder.none,
                      ),
                      controller: passWordControlller,
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: ButtonTheme(
                    height: 60,
                    minWidth: MediaQuery.of(context).size.width / 1.2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40),
                      ),
                    ),
                    child: MaterialButton(
                      color: Colors.amberAccent,
                      child: (Text("LOGIN")),
                      onPressed: () async {
                        await _auth.signInWithEmail(
                            loginController.text, passWordControlller.text);
                      },
                    ),
                  )),
              RichText(
                text: TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: "Register",
                          style: TextStyle(color: Colors.lightBlueAccent),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, '/register');
                            }),
                    ]),
              ),
              SizedBox(height: 5),
              RichText(
                text: TextSpan(
                    text: "Forgot password?",
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: " Reset",
                          style: TextStyle(color: Colors.lightBlueAccent),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, '/forgot_password');
                            }),
                    ]),
              ),
              SizedBox(
                height: 30,
              ),
              RichText(
                text: TextSpan(
                    text: "Having issues?",
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: " Contact me.",
                          style: TextStyle(color: Colors.lightBlueAccent),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              if (await canLaunch(
                                  'mailto:kunalghosh.res@gmail.com')) {
                                await launch('mailto:kunalghosh.res@gmail.com');
                              } else {
                                throw "There was an error sending email.";
                              }
                            }),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
