import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/View/Tab/AboutTab.dart';
import 'package:test_app/View/Tab/HomeTab.dart';
import 'package:test_app/View/Tab/ProductTab.dart';
import '../GlobleClass.dart';
class NavigationDrawerHome extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawerHome> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                color:Colors.red,
                padding: EdgeInsets.all(10.0),
                height: 90,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: Row(
                          children: [
                            SizedBox(width: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hy, "+Globle.userName,
                                  maxLines: 1,
                                  style: TextStyle(
                                    // decoration: TextDecoration.underline,
                                      fontSize: 15.0,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  Globle.password ,
                                  style: TextStyle(
                                      fontSize: 16.0, color: Colors.white70),
                                )
                              ],
                            ),
                          ],
                        )),

                  ],
                ),
              ),
              Expanded(
                child: Column(children: <Widget>[

                  ListTile(
                    title: Text(
                      'Home',
                      style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
                    ),
                    leading: Icon(
                      Icons.home,
                      size: 25.0,
                      color: Colors.grey[600],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Get.to(HomeTab());
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Product',
                      style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
                    ),
                    leading: Icon(
                      Icons.cake,
                      size: 25.0,
                      color: Colors.grey[600],
                    ),
                    onTap: () {
                      Get.to(ProductTab());
                    },
                  ),
                  ListTile(
                    title: Text(
                      'About',
                      style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
                    ),
                    leading: Icon(
                      Icons.account_box_outlined,
                      size: 25.0,
                      color: Colors.grey[600],
                    ),
                    onTap: () {
                      Get.to(AboutTab());
                    },
                  ),
                ]),
              ),

            ],
          ),
        ),
      ),
    );

  }



}