import 'package:flutter/material.dart';
import 'package:gusc/home/home.dart';
import 'package:gusc/pages/auth/auth_inflator.dart';
import 'package:gusc/pages/auth/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return MyHomePage(
        title: "Galgotias Student Council",
      );
    }
  }
}
