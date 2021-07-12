import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:terapia_app/Widgets/appBarWithBack.dart';

class OrderDetails extends StatefulWidget {
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBack(
        height: 153,
        title: "Order Details",
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Column(
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
                            "Delivery to Your Home ",
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
                      children: [
                        SizedBox(
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
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                Text(
                                  "Expiration Date : ",
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
                          "The drug was purchased recently and we do not need it, so we want to send it to anyone who wants to use it",
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
                  GestureDetector(
                    onTap: () {
                      showDialogWithFields(5);
                    },
                    child: new Container(
                        height: 45,
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(
                            left: 30, right: 30, top: 38,bottom: 20),
                        decoration: new BoxDecoration(
                            gradient: new LinearGradient(colors: [
                              Color(0xff6a77d0),
                              Colors.white
                            ]),
                            borderRadius:
                            new BorderRadius.circular(33)),
                        child: new Text('Request now',
                          style: TextStyle(
                              color: Colors.white, fontSize: 18),
                          textAlign: TextAlign.center,
                        )),
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
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                alignment: Alignment.topLeft,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void showDialogWithFields(int maxCount) {
    final _formKey = GlobalKey<FormState>();
    showDialog(
      context: context,
      builder: (_) {
        var emailController = TextEditingController();
        var messageController = TextEditingController();
        return Form(
          key: _formKey,
          child: AlertDialog(
            title: Text('Order now' ,textAlign: TextAlign.center,),
            backgroundColor: Color(0xffcee8f9),
            content: ListView(
              shrinkWrap: true,
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(hintText: 'Quantity'),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  validator: (value) {
                    if (int.parse(value) > maxCount) {
                      return 'Please enter Quantity less than product quantity.';
                    }else if (value.isEmpty) {
                      return 'Please enter a valid quantity.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: messageController,
                  decoration: InputDecoration(hintText: 'Message'),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10,top: 10),
                  child: Text(
                    "note : ",
                    style: TextStyle(color: Colors.blueGrey, fontSize: 16),
                  ),
                ),
                Text(
                  "- if sent, you approved to show your phone number to this user",
                  maxLines: 7,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "- After the request is approved, a notification will be sent to you, and you can contact the user.",
                    maxLines: 7,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
                child: Text('Cancel',style: TextStyle(color: Color(0xff6a77d0)),),
              ),
              TextButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Navigator.of(context, rootNavigator: true).pop();
                  }
                },
                child: Text('Send',style: TextStyle(color: Color(0xff6a77d0))),
              ),
            ],
          ),
        );
      },
    );
  }
}
