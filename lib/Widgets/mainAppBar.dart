import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const MainAppBar({
    Key key,
    @required this.height,
  }) : super(key: key);

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
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width,
      ),
      Container(), // Required some widget in between to float AppBar
      Positioned(
        // To take AppBar Size only
        top: 130.0,
        left: 20.0,
        right: 20.0,
        child: AppBar(
          backgroundColor: Colors.white,
          primary: false,
          title: TextField(
              decoration: InputDecoration(
                  hintText: "Search",
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey))),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search, color: Color(0xff218698)),
              onPressed: () {},
            ),
          ],
        ),
      )
    ]);
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
