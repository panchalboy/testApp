
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/View/GlobleClass.dart';
import 'package:test_app/View/HomeScreen.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _showPassword = true;
  bool checkValue = false;
  bool hasConnected = false;
  bool loading = false;




  @override
  Widget build(BuildContext context) {

    return Scaffold(
    backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(

          child: Container(

            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  // margin: ,
                  child: Column(
                    children: [
                      Container(
                        child: Form(
                            autovalidateMode: AutovalidateMode.always, key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  textInputAction: TextInputAction.next,
                                  controller: _userNameController,
                                  validator: MultiValidator([
                                    RequiredValidator(
                                        errorText: "User Name Required!")
                                  ]),
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                  keyboardType: TextInputType.emailAddress,
                                  autofocus: false,
                                  // initialValue: 'alucard@gmail.com',
                                  decoration: InputDecoration(
                                    labelText: 'User Name',
                                    labelStyle: TextStyle(
                                        fontSize: 16.0, color: Colors.black),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.black),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.black),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.black),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.black),
                                    ),
                                    errorStyle: TextStyle(color: Colors.black),
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.black),
                                    ),
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 10.0),
                                    // border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15),
                                TextFormField(
                                  textInputAction: TextInputAction.next,
                                  controller: _passwordController,
                                  autofocus: false,
                                  validator: MultiValidator([
                                    RequiredValidator(
                                        errorText: "Password Required!")
                                  ]),
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                  // initialValue: 'some password',
                                  obscureText: this._showPassword,
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    labelStyle: TextStyle(
                                        fontSize: 16.0, color: Colors.black),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.black),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.black),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.black),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.black),
                                    ),
                                    errorStyle: TextStyle(color: Colors.black),
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.black),
                                    ),
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 10.0),
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Colors.black,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        this._showPassword?Icons.visibility_off:Icons.visibility,
                                        color: this._showPassword
                                            ? Colors.grey
                                            : Colors.black,
                                      ),
                                      onPressed: () {
                                        setState(() => this._showPassword =
                                        !this._showPassword);
                                      },
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ),


                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 180,
                        height: 45,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(color: Colors.transparent)),
                          onPressed: () async{
                            if (_formKey.currentState!.validate()) {
                              CheckLoginnUser(context);
                              }
                            else {
                             print("else hare ");

                              }
                          },
                          color: Colors.red,
                          textColor: Colors.white,
                          child: Text("Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  void CheckLoginnUser(BuildContext context) async{
    Globle.userName = _userNameController.text;
    Globle.password = _passwordController.text;

    Get.to(HomeScreen());



  }
}