import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:terapia_app/Screens/Sign/login.dart';
import 'package:terapia_app/Widgets/persistentBottomNavigation.dart';



class ConfirmPhone extends StatefulWidget {
  var phone;

  ConfirmPhone(this.phone);

  @override
  ConfirmPhoneView createState() {
    return ConfirmPhoneView(this.phone);
  }
}

class ConfirmPhoneView extends State<ConfirmPhone> {
  String phone;

  ConfirmPhoneView(this.phone);

  Future phoneFuture;

  @override
  void initState() {
    phoneFuture = sendMessage();
    super.initState();
  }

  String code = '';

  Future<bool> sendMessage() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    // await _auth.signInAnonymously();
    await _auth.verifyPhoneNumber(
      phoneNumber: '+2' + phone,
      verificationCompleted: (PhoneAuthCredential credential) {
        code = credential.smsCode.toString();
        print('code' +code);
        codeController.text = credential.smsCode.toString();
      },
      // autoRetrievedSmsCodeForTesting: "432121",
      verificationFailed: (FirebaseAuthException e) {
        Fluttertoast.showToast(
            msg: e.message,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 3);
      },
      codeSent: (String verificationId, int resendToken) {
        verficationID = verificationId;
        Fluttertoast.showToast(
            msg: 'Code sent to Your phone',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  var verficationID;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void showSnackbar(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  void signInWithPhoneNumber(_verificationId,code) async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: code,
      );

      final User user = (await _auth.signInWithCredential(credential)).user;
      print('uid' +user.uid);
      if(user != null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => BottomNavigation()));
      } else {
        showSnackbar( 'Code invalid' );
      }
    } catch (e) {
      // Fluttertoast.showToast(
      //     msg: 'please enter valid code',
      //     toastLength: Toast.LENGTH_LONG,
      //     gravity: ToastGravity.SNACKBAR,
      //     timeInSecForIosWeb: 3);

      showSnackbar( 'Code invalid' );
    }
  }
  TextEditingController codeController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            key:_scaffoldKey,
            backgroundColor: Colors.black,
            body: ListView(shrinkWrap: true, children: [
              new Container(
                margin: EdgeInsets.only(top: 40),
                alignment: Alignment.center,
                child: new Image(image: AssetImage('images/logo.png'),width: 240,height: 240,),
              ),
              new Container(
                  margin: EdgeInsets.only(right: 20, left: 20,top:40),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.white10),
                  child: FutureBuilder(
                      future: phoneFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.none ||
                            snapshot.connectionState ==
                                ConnectionState.waiting) {
                          return new Container(
                              decoration:
                              new BoxDecoration(color: Color(0x99000000)),
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height,
                              child: Center(
                                  child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      new Container(
                                        margin: EdgeInsets.only(left: 14),
                                        alignment: Alignment.center,
                                        child: CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation(
                                              Color(0xffF6BF56)),
                                        ),
                                      ),
                                      new Container(
                                        margin: EdgeInsets.only(left: 17),
                                        child: new Text(
                                          'loading data' ,
                                          style: TextStyle(
                                              color: Color(0xffF6BF56),
                                              fontSize: 18),
                                        ),
                                      )
                                    ],
                                  )));
                        } else {
                          return Column(
                            children: [
                              new Container(
                                margin: EdgeInsets.only(top: 15),
                                alignment: Alignment.center,
                                child: Text(
                                  'Confirm phone'  ,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              new Container(
                                  margin: EdgeInsets.only(
                                      top: 15, right: 60, left: 60),
                                  alignment: Alignment.center,
                                  child: new RichText(
                                    textAlign: TextAlign.center,
                                    text: new TextSpan(
                                        text:  'Code sent ' ,

                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                        children: [
                                          new TextSpan(
                                            text:  '  Change' ,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff143267),
                                            ),
                                            recognizer:
                                            new TapGestureRecognizer()
                                              ..onTap = () =>
                                                  Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder:
                                                            (context) =>
                                                            LoginPage()),
                                                  ),
                                          )
                                        ]),
                                  )),
                              new Container(
                                  height: 56,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 30),
                                  margin: EdgeInsets.only(top: 20, left: 10),
                                  child:
                                  // PinCodeTextField(
                                  //   fieldWidth: 40.00,
                                  //   fields: 6,
                                  //   showFieldAsBox: true,
                                  //   onSubmit: (String pin) {
                                  //     showDialog(
                                  //         context: context,
                                  //         builder: (context) {
                                  //           return AlertDialog(
                                  //             title: Text("Pin"),
                                  //             content: Text('Pin entered is $pin'),
                                  //           );
                                  //         }); //end showDialog()
                                  //   },
                                  // )
                                  PinCodeTextField(
                                    onCompleted: (value) {
                                      print('value' + value);
                                      // if (value == code) {
                                      signInWithPhoneNumber(verficationID, value);
                                      // } else {
                                      // }
                                    },
                                    appContext: context,
                                    pastedTextStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    length: 6,
                                    enableActiveFill: true,
                                    backgroundColor: Color(0x99FFFFF),
                                    animationType: AnimationType.fade,
                                    // validator: (v) {
                                    //   if (v.length < 3) {
                                    //     return "I'm from validator";
                                    //   } else {
                                    //     return null;
                                    //   }
                                    // },
                                    pinTheme: PinTheme(
                                      inactiveFillColor: Colors.white,
                                      inactiveColor: Colors.white,
                                      disabledColor: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      fieldHeight: 40,
                                      fieldWidth: 40,
                                      activeColor: Colors.white,
                                      selectedColor: Colors.white,
                                      selectedFillColor: Colors.white,
                                      activeFillColor: Colors.white,
                                    ),
                                    onChanged: (String value) {},controller: codeController,
                                  )),
                              new GestureDetector(
                                  onTap: () {
                                    sendMessage();
                                  },
                                  child: new Container(
                                      height: 47,
                                      margin: EdgeInsets.only(
                                          top: 17, right: 35, left: 35),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Color(0xff374761),
                                          borderRadius:
                                          BorderRadius.circular(24)),
                                      child: new Text(
                                        'Confirm' ,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 17),
                                      ))),
                              new Container(
                                  margin: EdgeInsets.only(top: 15, bottom: 30),
                                  alignment: Alignment.center,
                                  child: new RichText(
                                    text: new TextSpan(
                                        text:  'Did you receive code?' ,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                        children: [
                                          new TextSpan(
                                            text:  '   Resend' ,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff143267),
                                            ),
                                            recognizer:
                                            new TapGestureRecognizer()
                                              ..onTap = () =>
                                                  Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder:
                                                            (context) =>
                                                            LoginPage()),
                                                  ),
                                          )
                                        ]),
                                  )),
                            ],
                          );
                        }
                      })),
            ])));
  }
}
