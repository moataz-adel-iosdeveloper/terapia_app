import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:terapia_app/Screens/MenuPages/aboutUs.dart';
import 'package:terapia_app/Screens/MenuPages/addMedication.dart';
import 'package:terapia_app/Screens/MenuPages/addPharmaceutical.dart';
import 'package:terapia_app/Screens/MenuPages/contactUs.dart';
import 'package:terapia_app/Screens/MenuPages/notificationPage.dart';
import 'package:terapia_app/Screens/MenuPages/profilePage.dart';
import 'package:terapia_app/Screens/MenuPages/requestMedication.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:terapia_app/Screens/Sign/login.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {

  List<AssetImage> _imageList = [
    AssetImage("images/user.png"),
    AssetImage("images/bell.png"),
    AssetImage("images/medicines.png"),
    AssetImage("images/business_idea.png"),
    AssetImage("images/heart.png"),
    AssetImage("images/call.png"),
    AssetImage("images/group.png"),
    AssetImage("images/signـin.png")
  ];
  List<String> _data = [
    'Profile',
    'Notification',
    'Add pharmaceutical',
    'request medication',
    'Add medication',
    'Contact us',
    'About us',
    'Login'
  ];
  List<Widget> _buildScreens = [
    ProfilePage(),
    NotificationPage(),
    AddPharmaceutical(),
    RequestMedication(),
    AddMedication(),
    ContactUs(),
    AboutUs()
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView.builder(
          itemCount: _data.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Container(
                height: 200,
                decoration: new BoxDecoration(
                    color: Color(0xff6a77d0),
                    gradient: LinearGradient(colors: [
                      Colors.white,
                      Color(0xff6a77d0)
                    ]),
                    borderRadius: new BorderRadius.only(
                      bottomLeft: const Radius.circular(20.0),
                      bottomRight: const Radius.circular(20.0),
                    )
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Container(
                        child: Image(
                          image: AssetImage('images/user.png'),
                          alignment: Alignment.center,
                          height: 130,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('User name : moataz mahfouz',
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'Cairo', fontWeight: FontWeight.bold),
                              //textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Phone number : 01xxxxxxxxx ',
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'Cairo', fontWeight: FontWeight.bold,),
                              //textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            else {
              return Padding(
                  padding: EdgeInsets.only(right: 10, top: 10 , bottom: 10),
                  child: InkWell(
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Card(
                            color: Color(0xFFF6F6F6),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Center(
                                child: Image(
                                  width:
                                  MediaQuery.of(context).size.width / 14,
                                  height:
                                  MediaQuery.of(context).size.width / 14,
                                  image: _imageList[index-1],
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 10 ,left: 20),
                          child: Text(
                            _data[index-1],
                            style: TextStyle(
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    onTap: (){
                      if (index == 8) {
                        pushNewScreen(
                          context,
                          screen: LoginPage(),
                          withNavBar: false, // OPTIONAL VALUE. True by default.
                          pageTransitionAnimation: PageTransitionAnimation.cupertino,
                        );

                      }
                      else {
                        pushNewScreenWithRouteSettings(
                          context,
                          settings: RouteSettings(name: '/MenuScreen'),
                          screen: _buildScreens[index-1],
                          withNavBar: true,
                          pageTransitionAnimation: PageTransitionAnimation.cupertino,
                        );
                      }
                    },
                  ));
            }
          }) ,
      );
  }
}
