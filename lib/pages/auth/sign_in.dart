import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gusc/pages/animation/fade_route_builder.dart';
import 'package:gusc/pages/auth/register.dart';
import 'package:gusc/services/auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:rect_getter/rect_getter.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final loginController = TextEditingController();
  bool _validateEmail = true;
  // bool _validatePassword = false;
  final passWordControlller = TextEditingController();
  GlobalKey rectGetterKey = RectGetter.createGlobalKey();
  Rect rect;
  final Duration animationDuration = Duration(milliseconds: 90);
  final Duration delay = Duration(milliseconds: 20);

  //TODO:ADD A METHOD TO ANIMATE SCROLL TO REQUIRED FOCUS NODE


  @override
  void dispose() {
    super.dispose();
    loginController.dispose();
    passWordControlller.dispose();
  }

  void _onTap() async {
    setState(() => rect = RectGetter.getRectFromKey(rectGetterKey));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() => rect = rect.inflate(1.3 *
          MediaQuery.of(context).size.longestSide)); 
      Future.delayed(animationDuration + delay,
          _goToNextPage);
    });
  }

  void _goToNextPage() {
    Navigator.of(context)
        .push(FadeRouteBuilder(page: RegisterUser()))
        .then((_) => setState(() => rect = null));
  }

  Widget _ripple() {
    if (rect == null) {
      return Container();
    }

    return AnimatedPositioned(
      duration: animationDuration,
      left: rect.left,
      right: MediaQuery.of(context).size.width - rect.right,
      top: rect.top,
      bottom: MediaQuery.of(context).size.height - rect.bottom,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.amberAccent,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Material(
                  elevation: 4,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(470, 300)),
                  child: RectGetter(
                    key: rectGetterKey,
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
                                          MediaQuery.of(context).size.width <
                                                  400
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
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                )),
                          ),
                        ])
                      ]),
                    ),
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
                      padding: EdgeInsets.only(
                          left: 20, right: 10, top: 5, bottom: 5),
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
                          errorText: _validateEmail
                              ? null
                              : 'Not a valid email, try again.',
                          hintText: "Email",
                          icon: Icon(
                            Icons.email,
                            color: _validateEmail
                                ? Colors.black
                                : Colors.redAccent,
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
                      padding: EdgeInsets.only(
                          left: 20, right: 10, top: 5, bottom: 5),
                      height: 60,
                      width: MediaQuery.of(context).size.width / 1.2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                      ),
                      child: TextField(
                        //TODO: ADD PASSWORD VALIDATION METHOD
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
                          setState(() {
                            EmailValidator.validate(loginController.text)
                                ? _validateEmail = true
                                : _validateEmail = false;
                          });
                          if (_validateEmail) {
                            print("valid");
                            try {
                              await _auth.signInWithEmail(loginController.text,
                                  passWordControlller.text);
                            } catch (e) {
                              print(e);
                            }
                          }
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
                                _onTap();
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
                                Navigator.pushNamed(
                                    context, '/forgot_password');
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
                                  await launch(
                                      'mailto:kunalghosh.res@gmail.com');
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
      ),
      _ripple(),
    ]);
  }
}
