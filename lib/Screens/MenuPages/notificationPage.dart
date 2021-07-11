import 'package:flutter/material.dart';
import 'package:terapia_app/Widgets/appBarWithBack.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBack(
        height: 154,
        title: "Notification",
      ),
      body: Container(
        color: Colors.indigo,
      ),
    );
  }
}
