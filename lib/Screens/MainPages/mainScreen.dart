import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:terapia_app/Screens/MenuPages/requestMedication.dart';
import 'package:terapia_app/Screens/OrderDetails/orderDetails.dart';
import 'package:terapia_app/Widgets/mainAppBar.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  List<MainScreenClass> _mainScreenClass = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(
          height: 160,
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: ListView.builder(
            itemBuilder: (context, index) => _makeCard(context, index),
            itemCount: _mainScreenClass.length,
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
                    image: AssetImage("images/medicine/"+_mainScreenClass[index].image+".jpg"),
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: 160,
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
                            _mainScreenClass[index].name,
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
                                _mainScreenClass[index].quantity,
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
                                _mainScreenClass[index].unit,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 15),
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Row(
                            children: [
                              Text(
                                "Price : ",
                                style:
                                TextStyle(color: Colors.blueGrey, fontSize: 16),
                              ),
                              Text(
                                "Free ",
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.red,
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
                                "Date : ",
                                style:
                                TextStyle(color: Colors.blueGrey, fontSize: 16),
                              ),
                              Text(
                                "1/7/2021 ",
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
                  color: _mainScreenClass[index].status  == "Required"
                      ? Colors.green // stopped
                      : Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(_mainScreenClass[index].status,
                      style: TextStyle(color: Colors.white, fontSize: 20),
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
            builder: (context) => OrderDetails(model: _mainScreenClass[index],)));
      },
    );
  }
  void updateView() {
    setState(() {
      _mainScreenClass = makeMainScreenClass();
    });
  }
  void initState() {
    super.initState();
    updateView();
  }
}

class MainScreenClass {
  int id;
  String name;
  String image;
  String quantity;
  String unit;
  String status;
  MainScreenClass(this.id, this.name,this.image,this.quantity,this.unit,this.status);
  MainScreenClass.fromJson(Map<String, dynamic> json) {
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

List<MainScreenClass> makeMainScreenClass() {
  List<Medicine> _medicineList = dataMedicine();
  List<MedicineType> _type = dataMedicineType();
  List<MainScreenClass> _mainScreenClass = [];
  int uniIndex = 0;
  for(int x = 9 ; x < 19 ; x++) {
    _mainScreenClass.add(MainScreenClass(_medicineList[x].id, _medicineList[x].name, _medicineList[x].image, x.toString()
        , _type[uniIndex].name , x%2 == 0 ? "Available" : "Required" ));
    uniIndex++;
    if (uniIndex == _type.length - 1) {
      uniIndex = 0;
    }
  }
  return _mainScreenClass;
}