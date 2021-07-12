import 'package:flutter/material.dart';
import 'package:terapia_app/Widgets/appBarWithBack.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController messageController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBack(
        height: 154,
        title: "Contact Us",
      ),
      body: Container(
        color: Color(0xFFcee8f9),
         child: Column(children: [
           new Container(
             height: 55,
             alignment: Alignment.center,
             decoration: new BoxDecoration(
                 borderRadius: new BorderRadius.circular(24),
                 color: Color(0xffc6cbd1)),
             margin: EdgeInsets.only(
                 right: 15, left: 15, bottom: 18, top: 20),
             child: new Row(
               children: [
                 new Container(
                   height: 32,
                   width: 32,
                   margin: EdgeInsets.only(right: 14, left: 14),
                   child: new Image(
                     image: AssetImage('images/man.png'),color: Colors.black,
                     fit: BoxFit.contain,
                   ),
                 ),
                 new Expanded(
                   child: new Container(
                       margin: EdgeInsets.only(left: 8),
                       child: new TextField(

                         controller: nameController,
                         decoration: InputDecoration(
                             border: InputBorder.none,
                             focusedBorder: InputBorder.none,
                             enabledBorder: InputBorder.none,
                             errorBorder: InputBorder.none,
                             disabledBorder: InputBorder.none,
                             hintText:  'Name' ,
                             hintStyle:
                             TextStyle(color: Colors.black,)),
                         style: TextStyle(
                             color:   Colors.black, fontSize: 17),
                         textAlign: TextAlign.start,
                       )),
                 ),
               ],
             ),
           ),
           new Container(
             height: 55,
             alignment: Alignment.center,
             decoration: new BoxDecoration(
               borderRadius: new BorderRadius.circular(24),
               color: Color(0xffc6cbd1),
             ),
             margin:
             EdgeInsets.only(right: 15, left: 15, bottom: 18),
             child: new Row(
               children: [
                 new Container(
                   height: 32,
                   width: 32,
                   margin: EdgeInsets.only(right: 14, left: 14),
                   child: new Image(
                     image: AssetImage('images/mail.png'),color: Colors.black,
                     fit: BoxFit.contain,
                   ),
                 ),
                 new Expanded(
                   child: new Container(
                       margin: EdgeInsets.only(left: 8),
                       child: new TextField(
                         controller: emailController,
                         decoration: InputDecoration(
                             border: InputBorder.none,
                             focusedBorder: InputBorder.none,
                             enabledBorder: InputBorder.none,
                             errorBorder: InputBorder.none,
                             disabledBorder: InputBorder.none,
                             hintText:'Email',
                             hintStyle:
                             TextStyle(color: Colors.black,)),
                         style: TextStyle(
                             color: Colors.black, fontSize: 17),
                         textAlign: TextAlign.start,
                       )),
                 ),
               ],
             ),
           ),
           new Container(
               height: 155,
               alignment: Alignment.topLeft,
               decoration: new BoxDecoration(
                 borderRadius: BorderRadius.circular(24),
                 color: Color(0xffc6cbd1),
               ),
               margin:
               EdgeInsets.only(right: 15, left: 15, bottom: 24),
               child: new TextField(
                 controller: messageController,
                 style: TextStyle(color: Colors.black, fontSize: 16),
                 textAlign: TextAlign.start,
                 decoration: new InputDecoration(
                   hintStyle: TextStyle(color: Colors.black,),
                   hintText: 'Your_message',
                   border: new OutlineInputBorder(
                     borderRadius: new BorderRadius.all(
                         new Radius.circular(5)),
                     borderSide: BorderSide(
                         width: 0, style: BorderStyle.none),
                   ),
                 ),
               )),
           new GestureDetector(
               onTap: () {
                 if (nameController.text.isEmpty) {
                   showSimpleDialog(
                       context,  'Please enter your name');
                 } else if (emailController.text.isEmpty) {
                   showSimpleDialog(
                       context,  'Please enter your email' );
                 } else if (messageController.text.isEmpty) {
                   showSimpleDialog(
                       context, 'Please enter your message' );
                 } else {
                   // postContactUs();
                 }
               },
               child: new Container(
                   height: 52,
                   margin:
                   EdgeInsets.only(top: 17, right: 25, left: 25),
                   alignment: Alignment.center,
                   decoration: BoxDecoration(
                        color: Color(0xffc6cbd1),
                       borderRadius: BorderRadius.circular(24)),
                   child: new Text(
                      'Send' ,
                     style: TextStyle(
                         color: Colors.black, fontSize: 17),
                   )))

         ],),
      ),
    );
  }
}

showSimpleDialog(BuildContext scontext,String message){
  return showDialog(
      builder:  (context){
        return SimpleDialog(
          shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                  width: 0, style: BorderStyle.none)) ,
          children: [
            Text('Message',textAlign: TextAlign.center,style: TextStyle(fontSize: 16))  ,
            new Container(margin:EdgeInsets.only(top: 7),child: Text(message,textAlign: TextAlign.center,style: TextStyle(fontSize: 18),),),
            new GestureDetector( onTap: () {
              Navigator.pop(context);
            },   child: Container(
              alignment: Alignment.center,
              width: 100,
              height: 34,
              margin: EdgeInsets.only(right: 60,left: 60,top: 13),
              decoration: new BoxDecoration(
                  color: Color(0xffF6BF56),
                  borderRadius: new BorderRadius.all(Radius.circular(12.0))),
              child: Text(
                "Ok",textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              // padding: EdgeInsets.all(5.0),

            ),
            ),
          ],
        );
      },context: scontext );
}