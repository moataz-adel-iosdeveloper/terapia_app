import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:terapia_app/Screens/Sign/login.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:terapia_app/Widgets/persistentBottomNavigation.dart';

class ConformPage extends StatefulWidget {
  var phone;
  ConformPage(this.phone);
  @override
  _ConformPageState createState() => _ConformPageState();
}

class _ConformPageState extends State<ConformPage> {
  TextEditingController codeController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blueGrey.withOpacity(0.75),
            body: Container(
              child: Center(
                child: Container(
                    margin: EdgeInsets.only(right: 20, left: 20),
                    height: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Color(0xffcee8f9)),
                    child: Column(
                      children: [
                        new Container(
                          margin: EdgeInsets.only(top: 15),
                          alignment: Alignment.center,
                          child: Text('Confirm Phone',
                            style: TextStyle(
                                color: Color(0xff6a77d0), fontSize: 20),
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
                                  text: 'Change Number  : ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                  children: [
                                    new TextSpan(
                                      text: 'change',
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
                            child: PinCodeTextField(
                              onCompleted: (value) {
                                print('value' + value);
                              },
                              appContext: context,
                              pastedTextStyle: TextStyle(
                                color: Colors.blueGrey,
                                //fontWeight: FontWeight.bold,
                              ),
                              length: 6,
                              enableActiveFill: true,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              backgroundColor: Color(0x99FFFFF),
                              animationType: AnimationType.fade,
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
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BottomNavigation()));
                              //sendMessage();
                            },
                            child: new Container(
                                height: 47,
                                margin: EdgeInsets.only(
                                    top: 17, right: 35, left: 35),
                                alignment: Alignment.center,
                                decoration: new BoxDecoration(
                                    gradient: new LinearGradient(colors: [
                                      Colors.white,
                                      Color(0xff6a77d0)
                                    ]),
                                    borderRadius:
                                    new BorderRadius.circular(33)),
                                child: new Text('confirm',
                                  style: TextStyle(color: Colors.white, fontSize: 17),
                                ))),
                        new Container(
                            margin: EdgeInsets.only(top: 15, bottom: 30),
                            alignment: Alignment.center,
                            child: new RichText(
                              text: new TextSpan(
                                  text: 'Did not receive sms   :  ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                  children: [
                                    new TextSpan(
                                      text: 'resend',
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
                    )),
              ),
            )));
  }
}
