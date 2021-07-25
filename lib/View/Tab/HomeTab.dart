import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/View/Model/HomeScreenModel.dart';
import 'package:test_app/View/NavigationDrawer/NavigationDrawerHome.dart';
import '../LoginScreen.dart';


class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}


class _HomeTabState extends State<HomeTab> {
  int _currentIndex = 0;

  List<HomeScreenModel> homeScreenModel=[
    HomeScreenModel("Asset/image/download.png"),
    HomeScreenModel("Asset/image/download.png"),
    HomeScreenModel("Asset/image/download.png"),
    HomeScreenModel("Asset/image/download.png"),
    HomeScreenModel("Asset/image/download.png"),
    HomeScreenModel("Asset/image/download.png"),
    HomeScreenModel("Asset/image/download.png"),
    HomeScreenModel("Asset/image/download.png"),
    HomeScreenModel("Asset/image/download.png"),
    HomeScreenModel("Asset/image/download.png"),
    HomeScreenModel("Asset/image/download.png"),
    HomeScreenModel("Asset/image/download.png"),
    HomeScreenModel("Asset/image/download.png"),
    HomeScreenModel("Asset/image/download.png"),
    HomeScreenModel("Asset/image/download.png"),
    HomeScreenModel("Asset/image/download.png"),
    HomeScreenModel("Asset/image/download.png"),
    HomeScreenModel("Asset/image/download.png"),



  ];
  @override
  Widget build(BuildContext context) {
    void onTabTapped(int index) {
      setState(() {
        _currentIndex = index;
      });
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("HomeTab"),
        actions: [
          IconButton(onPressed: (){
            _logout(context);
          }, icon: Icon(Icons.logout))
        ],
      ),
      drawer: NavigationDrawerHome(),

      body: SafeArea(
        child: Container(
          
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                child: Image.asset("Asset/image/imagesHome.png"),
              ),

              Expanded(
                child:GridView.count(
                    crossAxisCount:3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    children: List.generate(homeScreenModel.length, (index) {
                      return  Container(
                        width: 60.0,
                        height: 60.0,

                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("Asset/image/download.png"
                                )
                            )
                        ),
                      );
                    }),
                ) ,
              ),

            ],
          ),
        ),
      ),
    );
  }

  _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("userName", "");
    prefs.setString("password", "");
    Get.to(LoginScreen());
  }
}
