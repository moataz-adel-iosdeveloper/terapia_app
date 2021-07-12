import 'package:flutter/material.dart';

class AppBarWithBack extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String title;

  const AppBarWithBack({Key key, @required this.height, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        // Background
        child: Center(
          child: Image(
            image: AssetImage('images/logo.png'),
            alignment: Alignment.center,
            height: 85,
          ),
        ),
        color: Color(0xffcee8f9),
        height:  100,
        width: MediaQuery.of(context).size.width,
      ),
      Container(), // Required some widget in between to float AppBar
      Positioned(
        // To take AppBar Size only
        top: 100.0,
        left: 0.0,
        right: 0.0,
        child: AppBar(
          backgroundColor: Color(0xff6a77d0),
          primary: false,
          centerTitle: true,
          title: Container(
            color: Color(0xff6a77d0),
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.bold),
              //textAlign: TextAlign.center,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Color(0xffcee8f9)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      )
    ]);
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
