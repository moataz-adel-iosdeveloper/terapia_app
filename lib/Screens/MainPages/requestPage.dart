import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:terapia_app/Screens/OrderDetails/requestDetails.dart';
import 'package:terapia_app/Widgets/appBarWithOutBack.dart';


class RequestPage extends StatefulWidget {
  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWithOutBack(
          height: 153,
          title: "Requests List",
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: ListView.builder(
            itemBuilder: (context, index) => _makeCard(context, index),
            itemCount: 10,
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
                    image: AssetImage('images/medication.jpeg'),
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
                            "SAPOFEN JUNIOR 100MG-5ML ",
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
                                "5 ",
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
                                "tape ",
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
                  color: index  == 0
                      ? Colors.red // deleted
                      : index  == 1
                      ? Colors.green // active
                      : index  == 2
                      ? Colors.teal // pending
                      : index  == 3
                      ? Color(0xff6a77d0) // completed
                      : Colors.teal ,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      index == 0
                          ? "Deleted" // deleted
                          : index  == 1
                          ? "Active" // active
                          : index  == 2
                          ? "Pending" // pending
                          : index  == 3
                          ? "Completed" // completed
                          : "Pending" ,
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
                builder: (context) => RequestDetails()));
      },
    );
  }
}
