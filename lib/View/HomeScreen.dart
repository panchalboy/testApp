import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/View/GlobleClass.dart';
import 'package:test_app/View/Tab/AboutTab.dart';
import 'package:test_app/View/Tab/HomeTab.dart';
import 'package:test_app/View/Tab/ProductTab.dart';
import 'LoginScreen.dart';
import 'NavigationDrawer/NavigationDrawerHome.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> viewContainer = [
    HomeTab(),
    ProductTab(),
    AboutTab()
  ];

  @override
  Widget build(BuildContext context) {
    void onTabTapped(int index) {
      setState(() {
        _currentIndex = index;
      });
    }

    return Scaffold(
        body: WillPopScope(
            onWillPop: ()async => false,
            child: viewContainer[_currentIndex]),
        bottomNavigationBar: new BottomNavigationBar(
            onTap: onTabTapped,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            selectedItemColor: Theme.of(context).accentColor,
            unselectedItemColor: Colors.black,
            items: [
              BottomNavigationBarItem(
                icon: new Icon(
                  Icons.home,
                ),
                // ignore: deprecated_member_use
                title: Text("Home"),
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.cake),
                // ignore: deprecated_member_use
                title: Text("Product"),
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.account_balance_outlined),
                // ignore: deprecated_member_use
                title: Text("About"),
              ),

            ]),
        drawer: NavigationDrawerHome(),
        backgroundColor: Colors.transparent,

      );
  }
}




