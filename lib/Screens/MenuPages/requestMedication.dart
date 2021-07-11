import 'package:flutter/material.dart';
import 'package:terapia_app/Widgets/appBarWithBack.dart';


class RequestMedication extends StatefulWidget {
  @override
  _RequestMedicationState createState() => _RequestMedicationState();
}

class _RequestMedicationState extends State<RequestMedication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBack(
        height: 154,
        title: "Request Medication",
      ),
      body: Container(
        color: Colors.lime,
      ),
    );
  }
}
