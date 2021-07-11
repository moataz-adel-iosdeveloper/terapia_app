import 'package:flutter/material.dart';
import 'package:terapia_app/Widgets/mainAppBar.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        height: 180,
      ),
      body: ListView(),
    );
  }
}
