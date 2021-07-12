import 'package:flutter/material.dart';

class RequestDetails extends StatefulWidget {
  @override
  _RequestDetailsState createState() => _RequestDetailsState();
}

class _RequestDetailsState extends State<RequestDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(154.0),
      body: ListView.builder(
        itemBuilder: (context, index) => _makeCard(context, index),
        itemCount: 10,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
      ),
    );
  }

  _appBar(height) => PreferredSize(
      preferredSize:  Size.fromHeight(height),
      child: Stack(children: <Widget>[
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
          left: 0.0,
          right: 0.0,
          child: AppBar(
            backgroundColor: Color(0xff6a77d0),
            primary: false,
            centerTitle: true,
            title: Container(
              color: Color(0xff6a77d0),
              child: Text(
                "Request Details",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.bold),
                //textAlign: TextAlign.center,
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Color(0xffcee8f9)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 10,top: 4),
                child: DropdownButton<String>(
                  icon: Icon(Icons.more_vert_outlined, color: Color(0xffcee8f9),),
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 0,
                  ),
                  items: <String>['Edit', 'Stop'].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {},
                ),
              ),
            ],
          ),
        )
      ])
  );

  Widget _header(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage('images/medication.jpeg'),
              width: MediaQuery.of(context).size.width * 1.0,
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
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 15),
              child: Row(
                children: [
                  Text(
                    "Delivery method : ",
                    style: TextStyle(color: Colors.blueGrey, fontSize: 16),
                  ),
                  Expanded(
                    child: Text(
                      "To be agreed later ",
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      "note : ",
                      style: TextStyle(color: Colors.blueGrey, fontSize: 16),
                    ),
                  ),
                  Text(
                    "I hope for a quick reply because I need medicine.",
                    maxLines: 7,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 15),
              child: Text(
                "Response to this medication : ",
                style: TextStyle(color: Colors.blueGrey, fontSize: 16),
              ),
            ),
          ],
        ),
        Align(
          child: Container(
            color: //index%2  != 0
            //? Colors.red :
            Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                //index%2  == 0
                //? "Required":
                "Available",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          alignment: Alignment.topLeft,
        ),
      ],
    );
  }

  Widget _makeCard(BuildContext context, int index) {
    if (index == 0) {
      return _header(context);
    }else {
      return Card(
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
                        "Mohamed ali ",
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
                    Text(
                      "Address : ",
                      style: TextStyle(color: Colors.blueGrey, fontSize: 16),
                    ),
                    Expanded(
                      child: Text(
                        "3 مكرم عبيد - مدينه نصر ",
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
                            "3 ",
                            style:
                            TextStyle(color: Colors.blueGrey, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Row(
                        children: [
                          Text(
                            "Response Date : ",
                            style:
                            TextStyle(color: Colors.blueGrey, fontSize: 16),
                          ),
                          Expanded(
                            child: Text(
                              "1/7/2021 ",
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
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    //width: MediaQuery.of(context).size.width * 0.4,
                    child: GestureDetector(
                      onTap: () {
                        //showDialogWithFields(5);
                      },
                      child: Container(
                          height: 45,
                          alignment: Alignment.center,
                          //
                          margin: EdgeInsets.only(
                              left: 5, right: 5, top: 5,bottom: 5),
                          decoration: new BoxDecoration(
                              gradient: new LinearGradient(colors: [
                                Color(0xffacb1d4),
                                Color(0xff6a77d0),
                              ]),
                              borderRadius:
                              new BorderRadius.circular(33)),
                          child: new Text('Accept',
                            style: TextStyle(
                                color: Colors.white, fontSize: 18),
                            textAlign: TextAlign.center,
                          )),
                    ),
                  ),
                  Expanded(
                    //width: MediaQuery.of(context).size.width * 0.4,
                    child: GestureDetector(
                      onTap: () {
                        //showDialogWithFields(5);
                      },
                      child: Container(
                          height: 45,
                          alignment: Alignment.center,
                          // width: MediaQuery.of(context).size.width * 0.5,
                          margin: EdgeInsets.only(
                              left: 5, right: 5, top: 5,bottom: 5),
                          decoration: new BoxDecoration(
                              gradient: new LinearGradient(colors: [
                                Color(0xffdd337c),
                                Color(0xffe8edee),
                              ]),
                              borderRadius:
                              new BorderRadius.circular(33)),
                          child: new Text('Cancel',
                            style: TextStyle(
                                color: Colors.white, fontSize: 18),
                            textAlign: TextAlign.center,
                          )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }


}

