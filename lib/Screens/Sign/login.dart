import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 import 'package:terapia_app/Screens/Sign/registerPage.dart';
import 'package:terapia_app/Widgets/persistentBottomNavigation.dart';
import 'package:terapia_app/Widgets/transparent.dart';

import 'conformPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController mobileController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: new Scaffold(
          body: new Container(
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: AssetImage('images/background.png'),
                    fit: BoxFit.cover )),
            child: new ListView(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 55),
                    alignment: Alignment.center,
                    child: new Image(
                      image: AssetImage('images/logo.png'),
                      alignment: Alignment.center,
                      height: 300,
                    )),
                Container(
                    child: new Column(
                      children: [
                        Container(
                          child: new Column(
                            children: [
                              Container(
                                alignment: Alignment.bottomCenter,
                                margin:
                                EdgeInsets.only(left: 30, right: 30, top: 80),
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  controller: mobileController,
                                  decoration: new InputDecoration(
                                      border: new OutlineInputBorder(
                                        borderRadius: new BorderRadius.all(new Radius.circular(33)),
                                        borderSide: BorderSide(
                                            width: 0, style: BorderStyle.none),
                                      ),
                                      hintText: 'Phone number',
                                      fillColor: Colors.white,
                                      filled: true,
                                      contentPadding:
                                      EdgeInsets.only(left: 9, right: 9),
                                      hintStyle: new TextStyle(color: Colors.blueGrey),
                                      prefixIcon: new Container(
                                          padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                          child: Image(
                                            image: AssetImage('images/call.png'),
                                            height: 19,
                                            width: 15,
                                            fit: BoxFit.contain,
                                          ))),
                                  textAlign: TextAlign.start,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (mobileController.text.isNotEmpty) {
                                    Navigator.of(context).push(
                                        TransparentRoute(builder: (BuildContext context) => ConfirmPhone(
                                            mobileController.text))
                                    );
                                  }
                                },
                                child: new Container(
                                    height: 55,
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.only(
                                        left: 30, right: 30, top: 38),
                                    decoration: new BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                          Colors.white,
                                          Color(0xff6a77d0)
                                        ]),
                                        borderRadius:
                                        new BorderRadius.circular(33)),
                                    child: new Text('Confirm',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22),
                                      textAlign: TextAlign.center,
                                    )),
                              ),
                              GestureDetector(
                                onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => BottomNavigation()));
                                },
                                child: new Container(
                                    height: 55,
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.only(
                                        left: 30, right: 30, top: 38),
                                    decoration: new BoxDecoration(
                                        gradient: new LinearGradient(colors: [
                                          Color(0xff6a77d0),
                                          Colors.white
                                        ]),
                                        borderRadius:
                                        new BorderRadius.circular(33)),
                                    child: new Text('Skip',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                      textAlign: TextAlign.center,
                                    )),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => RegisterPage()),
                                    );
                                  },
                                  child: new Container(
                                      height: 40,
                                      alignment: Alignment.bottomCenter,
                                      margin: EdgeInsets.only(top: 28,bottom: 38),
                                      child: new Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        textDirection: TextDirection.rtl,
                                        children: [
                                          new Text('register',
                                            style: TextStyle(
                                                color: Colors.blueGrey,
                                                fontSize: 16),
                                          ),
                                          new Container(
                                              margin: EdgeInsets.only(
                                                  left: 19, right: 10),
                                              child: new Text("Not have account",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16),
                                              ))
                                        ],
                                      )))
                            ],
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}
