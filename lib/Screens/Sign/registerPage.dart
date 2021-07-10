import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:terapia_app/Screens/Sign/conformPage.dart';
import 'package:terapia_app/Screens/Sign/login.dart';
import 'package:terapia_app/Widgets/transparent.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  FocusNode nameNode = new FocusNode();
  FocusNode mobileNode = new FocusNode();
  FocusNode emailNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
              decoration: BoxDecoration(
                  image: new DecorationImage(
                      image: AssetImage('images/background.png'),
                      fit: BoxFit.cover)),
              child: new ListView(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 55),
                      alignment: Alignment.center,
                      child: new Image(
                        image: AssetImage('images/logo.png'),
                        alignment: Alignment.center,
                        height: 300,
                      )),
                  Container(
                      //height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          Container(
                            child: new Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 30, right: 30 , top: 30),
                                  child: new TextField(
                                    keyboardType: TextInputType.name,
                                    controller: nameController,
                                    focusNode: nameNode,
                                    decoration: new InputDecoration(
                                        border: new OutlineInputBorder(
                                          borderRadius: new BorderRadius.all(
                                              new Radius.circular(33)),
                                          borderSide: BorderSide(
                                              width: 0, style: BorderStyle.none),
                                        ),
                                        hintText: 'Full name',
                                        fillColor: Colors.white,
                                        filled: true,
                                        contentPadding:
                                        EdgeInsets.only(left: 9, right: 9),
                                        hintStyle:
                                        new TextStyle(color: Colors.blueGrey),
                                        prefixIcon: new Container(
                                            padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                            child: Image(
                                              image: AssetImage(
                                                  'images/man.png'),
                                              height: 19,
                                              width: 15,
                                              fit: BoxFit.contain,
                                            ))),
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin:
                                  EdgeInsets.only(left: 30, right: 30, top: 20),
                                  child: new TextField(
                                    keyboardType: TextInputType.number,
                                    controller: mobileController,
                                    focusNode: mobileNode,
                                    decoration: new InputDecoration(
                                        border: new OutlineInputBorder(
                                          borderRadius: new BorderRadius.all(
                                              new Radius.circular(33)),
                                          borderSide: BorderSide(
                                              width: 0, style: BorderStyle.none),
                                        ),
                                        hintText: 'Phone',
                                        fillColor: Colors.white,
                                        filled: true,
                                        contentPadding:
                                        EdgeInsets.only(left: 9, right: 9),
                                        hintStyle:
                                        new TextStyle(color: Colors.blueGrey),
                                        prefixIcon: new Container(
                                            padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                            child: Image(
                                              image: AssetImage(
                                                  'images/phone.png'),
                                              height: 19,
                                              width: 15,
                                              fit: BoxFit.contain,
                                            ))),
                                    textAlign: TextAlign.start,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin:
                                  EdgeInsets.only(left: 30, right: 30, top: 20),
                                  child: new TextField(
                                    keyboardType: TextInputType.text,
                                    controller: emailController,
                                    focusNode: emailNode,
                                    decoration: new InputDecoration(
                                        border: new OutlineInputBorder(
                                          borderRadius: new BorderRadius.all(
                                              new Radius.circular(33)),
                                          borderSide: BorderSide(
                                              width: 0, style: BorderStyle.none),
                                        ),
                                        hintText: 'E-mail',
                                        fillColor: Colors.white,
                                        filled: true,
                                        contentPadding:
                                        EdgeInsets.only(left: 9, right: 9),
                                        hintStyle:
                                        new TextStyle(color: Colors.blueGrey),
                                        prefixIcon: new Container(
                                            padding:
                                            EdgeInsets.symmetric(vertical: 14),
                                            child: Image(
                                              image: AssetImage(
                                                  'images/mail.png'),
                                              height: 19,
                                              width: 15,
                                              fit: BoxFit.contain,
                                            ))),
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          TransparentRoute(builder: (BuildContext context) => ConformPage(
                                              mobileController.text))
                                      );
                                      // if (checkData(context)) {
                                      //   showProgressDialog(context);
                                      //   new FutureBuilder(
                                      //       future: reg(
                                      //           http.Client(),
                                      //           emailController.text,
                                      //           mobileController.text,
                                      //           nameController.text,
                                      //           context),
                                      //       builder: (context, snapshot) {
                                      //         if (snapshot.error != null) {
                                      //           Navigator.pop(context);
                                      //           Scaffold.of(context).showSnackBar(
                                      //               SnackBar(
                                      //                   content: new Text(snapshot
                                      //                       .error
                                      //                       .toString())));
                                      //         } else if (snapshot
                                      //             .hasData) if (snapshot
                                      //             .connectionState ==
                                      //             ConnectionState.done) {
                                      //           LoginResponse model = snapshot.data;
                                      //
                                      //           Navigator.pop(context);
                                      //
                                      //           Navigator.pushReplacement(
                                      //             context,
                                      //             MaterialPageRoute(
                                      //                 builder: (context) =>
                                      //                     MainActivity()),
                                      //           );
                                      //         } else {
                                      //           Navigator.pop(context);
                                      //           Scaffold.of(context)
                                      //               .showSnackBar(SnackBar(
                                      //             content: Text(
                                      //                 "رقم الهاتف او البريد الالكتروني مسجل من قبل"),
                                      //           ));
                                      //         }
                                      //         return Container();
                                      //       });
                                      // }
                                    },
                                    child: new Container(
                                      height: 55,
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width,
                                      margin: EdgeInsets.only(
                                          left: 30, right: 30, top: 58),
                                      decoration: new BoxDecoration(
                                          gradient: new LinearGradient(colors: [
                                            Colors.white,
                                            Color(0xff6a77d0)
                                          ]),
                                          borderRadius:
                                          new BorderRadius.circular(33)),
                                      child: new Text('Register',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 22),
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => LoginPage()));
                                    },
                                    child: new Container(
                                        height: 50,
                                        alignment: Alignment.bottomCenter,
                                        child: new Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          textDirection: TextDirection.rtl,
                                          children: [
                                            new Text('login',
                                              style: TextStyle(
                                                  color: Colors.blueGrey,
                                                  fontSize: 16),
                                            ),
                                            new Container(
                                                margin: EdgeInsets.only(
                                                    left: 19, right: 10),
                                                child: new Text('Have account',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16),
                                                ))
                                          ],
                                        )))
                              ],
                            ),
                          )
                        ],
                      ))
                ],
              ),
            )));
  }
}
