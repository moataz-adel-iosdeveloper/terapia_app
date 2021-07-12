import 'package:flutter/material.dart';
import 'package:terapia_app/Widgets/appBarWithBack.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWithBack(
          height: 154,
          title: "About US",
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Container(
            child: Image(
              image: AssetImage('images/about_us.png'),
              fit: BoxFit.fitHeight,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
          ),
        ),
      ),
    );
  }
}
