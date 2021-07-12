import 'package:flutter/material.dart';
import 'package:terapia_app/Widgets/appBarWithBack.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  @override
  Widget build(BuildContext context) {
    int arrayindex; final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWithBack(
          height: 154,
          title: "Notification",
        ),
        body: Container(
          height: size.height,
          color: Color(0xFFcee8f9),
          child: Container(
            child: ListView.builder(
                itemBuilder: (context, index) {
                  arrayindex = index;
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      children: <Widget>[
                        ListView.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 8.0,
                              ),
                              child: Container(
                                  decoration: new BoxDecoration(
                                      color: Color(0x99c6cbd1),
                                      borderRadius:
                                      BorderRadius.circular(13)),
                                  width: size.width,
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    textDirection: TextDirection.ltr,
                                    children: [
                                      new Flexible(
                                          flex: 1,
                                          fit: FlexFit.loose,
                                          child:
                                          new Container(
                                              margin: EdgeInsets.only(right: 10),
                                              child: Image(image: AssetImage(
                                                  'images/note.png'),)
                                          )),
                                      new Flexible(
                                          flex: 3,
                                          fit: FlexFit.tight,
                                          child:
                                          new Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              new Container(
                                                  margin: EdgeInsets.only(
                                                      left: 14),
                                                  alignment: Alignment.centerLeft,
                                                  child: Text( notificationsList[index].title  ,
                                                    style: TextStyle(fontSize: 13,
                                                        color: Colors.black45),textAlign: TextAlign.right,)
                                              ),
                                              new Container(
                                                  alignment: Alignment.centerLeft,
                                                  margin: EdgeInsets.only(
                                                      left: 14,top: 6),
                                                  child: Text( notificationsList[index].notyBody ,
                                                      style: TextStyle(fontSize: 13,
                                                          color: Colors.black45),textAlign: TextAlign.right)
                                              ),


                                            ],))

                                    ],)),
                            );
                          },
                          itemCount: notificationsList.length,
                          shrinkWrap: true,
                          // todo comment this out and check the result
                          physics: ClampingScrollPhysics(), // todo comment this out and check the result
                        ),
                      ],
                    ),
                  );
                },
                itemCount: 1
            ),

          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    notificationsList.clear();
    notificationsList.add(new Notification(1,"Notification from user","Medicine had sent",11,'',''));
    notificationsList.add(new Notification(1,"Notification from user","Medicine had sent",11,'',''));
    super.initState();
  }
}

List<Notification> notificationsList = [];
  class Notification {
  int id;
  String title;
  String notyBody;
  int toUser;
  String status;
  String created;

  Notification(this.id,
  this.title,
  this.notyBody,
  this.toUser,
  this.status,
  this.created);

  Notification.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  title = json['title'];
  notyBody = json['noty_body'];
  toUser = json['toUser'];
  status = json['status'];
  created = json['created'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = this.id;
  data['title'] = this.title;
  data['noty_body'] = this.notyBody;
  data['toUser'] = this.toUser;
  data['status'] = this.status;
  data['created'] = this.created;
  return data;
  }
  }


