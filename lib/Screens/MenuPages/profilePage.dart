import 'package:flutter/material.dart';
import 'package:terapia_app/Widgets/appBarWithBack.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBarWithBack(
              height: 184,
              title: "Profile",
            ),
            body: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .0)),
                child:ListView(children: [new Column(
                  children: [
                    new Stack(
                      children: [
                        new Container(
                          height: 110,
                          width: 110,
                          alignment: Alignment.center,
                          child: ClipOval(
                            child:
                            Image.asset(
                                'images/user.png'),
                          ),
                        ),
                        new Container(
                          height: 40,
                          width: 40,
                          alignment: Alignment.bottomRight,
                          margin: EdgeInsets.only(top: 90, left: 0),
                          child: Image(
                            image: AssetImage(
                                'images/camera.png'),
                          ),
                        )
                      ],
                    ),
                    new Container(
                      margin:
                      EdgeInsets.only(right: 30, left: 30, top: 10),
                      height: 52,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Color(0xffcee8f9)),
                      child: Row(
                        children: [
                          new Container(
                            height: 32,
                            width: 32,
                            alignment: Alignment.centerLeft,
                            child: Image(
                              image:
                              AssetImage('images/man.png'),color: Colors.blueGrey,
                            ),
                            margin:
                            EdgeInsets.only(left: 20, right: 14),
                          ),
                          new Text(
                            "Client Name",
                            style: TextStyle(
                                color: Colors.blueGrey, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    new Container(
                      margin:
                      EdgeInsets.only(right: 30, left: 30, top: 16),
                      height: 52,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Color(0xffcee8f9)),
                      child: Row(
                        children: [
                          new Container(
                            height: 32,
                            width: 32,
                            alignment: Alignment.centerLeft,
                            child: Image(
                              image: AssetImage(
                                  'images/call.png'),color: Colors.blueGrey,
                            ),
                            margin:
                            EdgeInsets.only(left: 20, right: 14),
                          ),
                          new Text(
                            "Phone Number",
                            style: TextStyle(
                                color: Colors.blueGrey, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    new Container(
                      margin:
                      EdgeInsets.only(right: 30, left: 30, top: 16),
                      height: 52,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Color(0xffcee8f9)),
                      child: Row(
                        children: [
                          new Container(
                            height: 32,
                            width: 32,
                            alignment: Alignment.centerLeft,
                            child: Image(
                              image: AssetImage(
                                  'images/mail.png'),color: Colors.blueGrey,
                            ),
                            margin:
                            EdgeInsets.only(left: 20, right: 14),
                          ),
                          new Text(
                            "Email",
                            style: TextStyle(
                                color: Colors.blueGrey, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    new Container(
                      margin:
                      EdgeInsets.only(right: 30, left: 30, top: 16),
                      height: 52,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Color(0xffcee8f9)),
                      child: Row(
                        children: [
                          new Container(
                            height: 32,
                            width: 32,
                            alignment: Alignment.centerLeft,
                            child: Image(
                              image: AssetImage(
                                  'images/gift.png'),color: Colors.blueGrey,
                            ),
                            margin:
                            EdgeInsets.only(left: 20, right: 14),
                          ),
                          new Text(
                            "BirthDate",
                            style: TextStyle(
                                color: Colors.blueGrey, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    new Container(
                      margin:
                      EdgeInsets.only(right: 30, left: 30, top: 16),
                      height: 52,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Color(0xffcee8f9)),
                      child: Row(
                        children: [
                          new Container(
                            height: 32,
                            width: 32,
                            alignment: Alignment.centerLeft,
                            child: Image(
                              image: AssetImage(
                                  'images/flags.png'),color: Colors.blueGrey,
                            ),
                            margin:
                            EdgeInsets.only(left: 20, right: 14),
                          ),
                          new Text(
                            "National ID",
                            style: TextStyle(
                                color: Colors.blueGrey, fontSize: 15),
                          )
                        ],
                      ),
                    )
                  ],
                )
                ]))
        ));
  }
}
