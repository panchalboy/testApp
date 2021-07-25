import 'package:flutter/material.dart';
import 'package:test_app/View/NavigationDrawer/NavigationDrawerHome.dart';
class AboutTab extends StatefulWidget {
  const AboutTab({Key? key}) : super(key: key);

  @override
  _AboutTabState createState() => _AboutTabState();
}

class _AboutTabState extends State<AboutTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("About"),

      ),
      drawer: NavigationDrawerHome(),
      body: SafeArea(
        child: Center(
          child: Text("About Tab"),
        ),
      ),
    );
  }
}
