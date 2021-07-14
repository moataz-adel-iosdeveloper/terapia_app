import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:terapia_app/Screens/MenuPages/requestMedication.dart';
import 'package:terapia_app/Screens/OrderDetails/contributionDetails.dart';
import 'package:terapia_app/Widgets/appBarWithOutBack.dart';

class ContributionPage extends StatefulWidget {
  @override
  _ContributionPageState createState() => _ContributionPageState();
}

class _ContributionPageState extends State<ContributionPage> {
  List<ContributionPageClass> _contributionPageClass = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWithOutBack(
          height: 153,
          title: "Contributions Lists",
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: ListView.builder(
            itemBuilder: (context, index) => _makeCard(context, index),
            itemCount: _contributionPageClass.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
          ),
        ));
  }
  Widget _makeCard(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .0)),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image(
                    image: AssetImage("images/medicine/"+_contributionPageClass[index].image+".jpg"),
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 15, top: 15),
                    child: Row(
                      children: [
                        Text(
                          "Name : ",
                          style: TextStyle(color: Colors.blueGrey, fontSize: 16),
                        ),
                        Expanded(
                          child: Text(
                            _contributionPageClass[index].name,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 15),
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Row(
                            children: [
                              Text(
                                "Quantity : ",
                                style:
                                TextStyle(color: Colors.blueGrey, fontSize: 16),
                              ),
                              Text(
                                _contributionPageClass[index].quantity,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Row(
                            children: [
                              Text(
                                "Unit : ",
                                style:
                                TextStyle(color: Colors.blueGrey, fontSize: 16),
                              ),
                              Text(
                                _contributionPageClass[index].unit,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                child: Container(
                  color: _contributionPageClass[index].status  == "Stopped"
                      ? Colors.red // stopped
                      : _contributionPageClass[index].status  == "Active"
                      ? Colors.green // active
                      : _contributionPageClass[index].status  == "Pending"
                      ? Colors.teal // pending
                      : _contributionPageClass[index].status  == "Completed"
                      ? Color(0xff6a77d0) // completed
                      : Colors.teal ,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(_contributionPageClass[index].status , // pending
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                alignment: Alignment.topLeft,
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ContributionDetails(model: _contributionPageClass[index],)));
      },
    );
  }
  void updateView() {
    setState(() {
      _contributionPageClass = makeContributionPageClass();
    });
  }
  void initState() {
    super.initState();
    updateView();
  }
}
class ContributionPageClass {
  int id;
  String name;
  String image;
  String quantity;
  String unit;
  String status;
  ContributionPageClass(this.id, this.name,this.image,this.quantity,this.unit,this.status);
  ContributionPageClass.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    quantity = json['quantity'];
    unit = json['unit'];
    status = json['status'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['quantity'] = this.quantity;
    data['unit'] = this.unit;
    data['status'] = this.status;
    return data;
  }
}
List<ContributionPageClass> makeContributionPageClass() {
  List<Medicine> _medicineList = dataMedicine();
  List<MedicineType> _type = dataMedicineType();
  List<ContributionPageClass> _mainScreenClass = [];
  int uniIndex = 0;
  int statusIndex = 0;
  for(int x = 5 ; x < 15 ; x++) {
    _mainScreenClass.add(ContributionPageClass(_medicineList[x].id, _medicineList[x].name, _medicineList[x].image, x.toString()
        , _type[uniIndex].name,statusIndex == 0 ? "Stopped": statusIndex == 1 ? "Active" : statusIndex == 2 ? "Pending" : "Completed"));
    uniIndex++;
    statusIndex++;
    if (uniIndex == _type.length - 1) {
      uniIndex = 0;
    }
    if (statusIndex == 3) {
      statusIndex = 0;
    }
  }
  return _mainScreenClass;
}
