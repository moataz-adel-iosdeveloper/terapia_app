import 'package:flutter/material.dart';
import 'package:terapia_app/Widgets/appBarWithBack.dart';

class AddPharmaceutical extends StatefulWidget {
  @override
  _AddPharmaceuticalState createState() => _AddPharmaceuticalState();
}

class _AddPharmaceuticalState extends State<AddPharmaceutical> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBack(
        height: 154,
        title: "Add Pharmaceutical",
      ),
      body: Container(
        color: Colors.indigoAccent,
      ),
    );
  }
}
