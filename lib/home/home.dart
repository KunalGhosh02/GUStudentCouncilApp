import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:gusc/pages/clubs.dart';
import 'package:gusc/pages/events.dart';
import 'package:gusc/pages/faculty.dart';
import 'package:gusc/pages/landing.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  final pageController = PageController(initialPage: 0, keepPage: true);

  @override
  Widget build(BuildContext context) {
    void pageChaned(int index) {
      setState(() {
        currentIndex = index;
      });
    }

    void navSelected(int index) {
      setState(() {
        currentIndex = index;
        pageController.animateToPage(index,
            duration: Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
      });
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.amberAccent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'lib/assets/logos/gu.png',
                fit: BoxFit.contain,
                height: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Galgotias Student Council",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.account_circle),
              iconSize: 40,
              tooltip: "Settings",
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          pageChaned(index);
        },
        children: <Widget>[
          Landing(),
          Clubs(),
          Events(),
          Faculty(),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        showElevation: true,
        itemCornerRadius: 8,
        onItemSelected: (index) {
          navSelected(index);
        },
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Home'),
            activeColor: Colors.red,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.dvr),
            title: Text('Clubs'),
            activeColor: Colors.greenAccent,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.blur_on),
            title: Text('Events'),
            activeColor: Colors.pink,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.group),
            title: Text('Profile'),
            activeColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
