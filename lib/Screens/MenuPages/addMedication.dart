import 'package:flutter/material.dart';
import 'package:terapia_app/Widgets/appBarWithBack.dart';

class AddMedication extends StatefulWidget {
  @override
  _AddMedicationState createState() => _AddMedicationState();
}

class _AddMedicationState extends State<AddMedication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBack(
        height: 154,
        title: "Add Medication",
      ),
      body: Container(
        color: Colors.purpleAccent,
      ),
    );
  }
}
