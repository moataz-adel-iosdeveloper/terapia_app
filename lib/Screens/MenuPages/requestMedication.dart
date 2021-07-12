import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:terapia_app/Widgets/appBarWithBack.dart';
import 'package:file_picker/file_picker.dart' as picker;

class RequestMedication extends StatefulWidget {
  @override
  _RequestMedicationState createState() => _RequestMedicationState();
}

List<Medicine> medicineLista = [];
List<String> _DeliveryOption = ["to by agreed later" , "Delivery to me " , "Receive it from anywhere"];
String _deliveryMethod ;

class _RequestMedicationState extends State<RequestMedication> {

  //TextEditingController _quantityText = new TextEditingController();
  TextEditingController messageController = new TextEditingController();
  @override
  void initState() {
    //medicineLista.add(new Medicine(1, "Panadol", "Capsule", 1));
    //medicineLista.add(new Medicine(1, "profen", "Capsule", 2));
    //medicineLista.add(new Medicine(0, 'name', 'type', 3));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBarWithBack(
              height: 154,
              title: "Request Medication",
            ),
            body: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: ListView(
                  children: [
                    Column(
                      verticalDirection: VerticalDirection.down,
                      children: [
                        GestureDetector(
                            onTap: () {
                              AddMedicineDialog(context, '');
                            },
                            child: Row(
                                textDirection: TextDirection.ltr,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 15, top: 15),
                                    child: Text(
                                      'Choose Medication   ',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 22),
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(top: 15),
                                      child: Icon(
                                        Icons.add_circle,
                                        color: Colors.black,
                                      ))
                                ])),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemCount: medicineLista.length,
                            itemBuilder: (context, index) {
                              return Container(
                                key: UniqueKey(),
                                margin: EdgeInsets.only(
                                    right: 18, left: 18, top: 9, bottom: 9),
                                decoration: new BoxDecoration(
                                    color: Color(0xFFcee8f9),
                                    borderRadius: BorderRadius.circular(13)),
                                child: Column(
                                  children: [
                                    Row(
                                      textDirection: TextDirection.ltr,
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Container(
                                              margin: EdgeInsets.only(top: 9),
                                              padding: EdgeInsets.all(8),
                                              alignment: Alignment.center,
                                              child: Image(
                                                image: AssetImage(
                                                    'images/logo.png'),
                                              ),
                                            )),
                                        Expanded(
                                            flex: 2,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    margin: EdgeInsets.all(6),
                                                    child: Text(
                                                      medicineLista[index].name,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18),
                                                    )),
                                                Container(
                                                    margin: EdgeInsets.all(2),
                                                    child: Text(
                                                      medicineLista[index].type,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18),
                                                    )),
                                                Container(
                                                    margin: EdgeInsets.all(3),
                                                    child: Text(
                                                      medicineLista[index]
                                                          .quantity
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18),
                                                    )),
                                              ],
                                            ))
                                      ],
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Flexible(
                                              flex: 1,
                                              fit: FlexFit.loose,
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    medicineLista =
                                                        List.from(medicineLista)
                                                          ..removeAt(index);
                                                  });
                                                },
                                                child: Container(
                                                    alignment: Alignment.center,
                                                    padding: EdgeInsets.all(7),
                                                    margin: EdgeInsets.only(
                                                        top: 9,
                                                        right: 9,
                                                        left: 9,
                                                        bottom: 12),
                                                    width: 120,
                                                    decoration:
                                                        new BoxDecoration(
                                                            color: Colors.red,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        13)),
                                                    child: Text(
                                                      'Delete',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    )),
                                              )),
                                          Flexible(
                                              flex: 1,
                                              fit: FlexFit.loose,
                                              child: GestureDetector(
                                                onTap: () {
                                                  EditMedicineDialog(
                                                      context,
                                                      medicineLista[index],
                                                      index);
                                                },
                                                child: Container(
                                                    padding: EdgeInsets.all(7),
                                                    width: 120,
                                                    margin: EdgeInsets.only(
                                                        top: 9,
                                                        right: 9,
                                                        left: 9,
                                                        bottom: 12),
                                                    alignment: Alignment.center,
                                                    decoration:
                                                        new BoxDecoration(
                                                            color:
                                                                Colors.indigo,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        13)),
                                                    child: Text(
                                                      'Edit',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    )),
                                              )),
                                        ])
                                  ],
                                ),
                              );
                            }),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        _openFileExplorer();
                      },
                      child: Container(
                          height: 180,
                          margin: EdgeInsets.only(
                              right: 18, left: 18, top: 9, bottom: 25),
                          alignment: Alignment.center,
                          decoration: new BoxDecoration(
                              color: Color(0xFFcee8f9),
                              borderRadius: BorderRadius.circular(13)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Visibility(
                                    visible: imagePath == null,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Attach a prescription',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17),
                                          textAlign: TextAlign.center,
                                        ),
                                        Icon(Icons.upload_sharp)
                                      ],
                                    )),
                                Visibility(
                                    visible: imagePath != null,
                                    child: Image(
                                      image: imagePath != null
                                          ? FileImage(
                                              File(imagePath),
                                            )
                                          : AssetImage('images/big_camera.png'),
                                      width: 240,
                                      height: 120,
                                      alignment: Alignment.center,
                                      fit: BoxFit.fill,
                                    ))
                              ])),
                    ),
                    // Container(
                    //   //alignment: Alignment.bottomCenter,
                    //   margin: EdgeInsets.only(left: 20, right: 20, top: 10,bottom: 10),
                    //   child: TextField(
                    //     keyboardType: TextInputType.number,
                    //     controller: _quantityText,
                    //     decoration: new InputDecoration(
                    //         border: new OutlineInputBorder(
                    //           borderRadius: new BorderRadius.all(new Radius.circular(10)),
                    //           borderSide: BorderSide(
                    //               width: 0, style: BorderStyle.solid),
                    //         ),
                    //         hintText: 'quantity',
                    //         fillColor: Colors.white,
                    //         filled: true,
                    //         hintStyle: new TextStyle(color: Colors.blueGrey),
                    //     ),
                    //     textAlign: TextAlign.start,
                    //     inputFormatters: <TextInputFormatter>[
                    //       FilteringTextInputFormatter.digitsOnly
                    //     ],
                    //     style: TextStyle(
                    //       color: Colors.black,
                    //       fontSize: 15,
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          padding: EdgeInsets.only(
                            right: 10,
                            left: 10,
                          ),
                          child: _DeliveryOption != null
                              ? DropdownButtonHideUnderline(
                            child: DropdownButton(
                              isExpanded: true,
                              hint: Text('Delivery Method'),
                              icon: Icon(Icons.keyboard_arrow_down),
                              style: TextStyle(color: Colors.black),
                              iconSize: 24,
                              value: _deliveryMethod,
                              elevation: 16,
                              onChanged: (newValue) {
                                setState(() {
                                  _deliveryMethod = newValue;
                                });
                              },
                              items: _DeliveryOption.map((String dropdownItems) {
                                return DropdownMenuItem<String>(
                                  child: Text(dropdownItems),
                                  value: dropdownItems,
                                );
                              }).toList(),
                            ),
                          )
                              : Container(),
                        ),
                      ),
                    ),
                    Container(
                        height: 155,
                        alignment: Alignment.topLeft,
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Color(0xFFcee8f9),
                        ),
                        margin: EdgeInsets.only(right: 20, left: 20, bottom: 10,top: 10),
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
                    Container(
                        padding: EdgeInsets.all(11),
                        width: 160,
                        margin: EdgeInsets.only(
                            top: 19, right: 39, left: 39, bottom: 22),
                        alignment: Alignment.center,
                        decoration: new BoxDecoration(
                            color: Color(0xff374761),
                            borderRadius: BorderRadius.circular(13)),
                        child: Text(
                          'Send',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          textAlign: TextAlign.center,
                        )),
                  ],
                ))));
  }

  void updateView() {
    setState(() {});
  }

  Uint8List fileBytes;
  File file;
  var _paths, _loadingPath = false;
  var _directoryPath, _pickingType, _fileName = '';
  picker.FilePickerResult result;

  void _openFileExplorer() async {
    setState(() => _loadingPath = true);
    try {
      _directoryPath = null;
      result = await picker.FilePicker.platform.pickFiles(
        type: picker.FileType.custom, withReadStream: true,
        allowMultiple: false,
        // allowedExtensions: ['pdf'],
      );
      // ?.files;
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }
    if (!mounted) return;
    fileBytes = result.files.first.bytes;
    imagePath = result.files.first.path;
    // print('pathtt'+_paths.map((e) => e.path).toString());
    //   file = new File(result.files.first.bytes);
    // print(file.path);
    setState(() {
      _loadingPath = false;
      _fileName = result != null
          ? result.files.length > 0
              ? result.files.first.name
              : ''
          : '';
    });
  }

  var imagePath;

  AddMedicineDialog(BuildContext context, String message) {
    TypeList.clear();
    medicineList.clear();
    makeupList.clear();
    TypeList.add(new Clients(1, 'Medicine'));
    TypeList.add(new Clients(2, 'Makeup'));

    medicineList.add(new Clients(1, 'Panadol'));
    medicineList.add(new Clients(2, 'Profen'));

    makeupList.add(new Clients(1, 'iShadow'));
    makeupList.add(new Clients(2, 'Eye Liner'));

    _typeDropdownMenuItems = buildDropDownMenuItems(TypeList);
    _nameDropdownMenuItems = buildDropDownMenuItems(medicineList);
    _typeSelectedItem = TypeList[0];
    _nameSelectedItem = medicineList[0];
    return showDialog(
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return SimpleDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(width: 0, style: BorderStyle.none)),
              children: [
                Row(
                  children: [
                    Flexible(
                      flex: 2,
                      fit: FlexFit.loose,
                      child: Container(
                        margin: EdgeInsets.only(left: 14, top: 10),
                        child: Text(
                          'Medicine Type ',
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 4,
                        child: Container(
                            height: 30,
                            alignment: Alignment.centerLeft,
                            decoration: new BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  new BorderRadius.all(Radius.circular(12.0)),
                              border: Border.all(
                                  width: 0.6,
                                  color: Colors.grey,
                                  style: BorderStyle.solid),
                            ),
                            margin:
                                EdgeInsets.only(left: 7, right: 10, top: 10),
                            child: Directionality(
                                textDirection: TextDirection.ltr,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<Clients>(
                                      isExpanded: true,
                                      value: _typeSelectedItem,
                                      items: _typeDropdownMenuItems,
                                      onChanged: (value) {
                                        setState(() {
                                          _typeSelectedItem = value;
                                          if (value.id == 2) {
                                            _nameDropdownMenuItems =
                                                buildDropDownMenuItems(
                                                    makeupList);
                                            _nameSelectedItem = makeupList[0];
                                          } else {
                                            _nameDropdownMenuItems =
                                                buildDropDownMenuItems(
                                                    medicineList);
                                            _nameSelectedItem = medicineList[0];
                                          }
                                        });
                                      }),
                                )))),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 2,
                      fit: FlexFit.loose,
                      child: Container(
                        margin: EdgeInsets.only(left: 14, top: 10),
                        child: Text(
                          'Medicine Name ',
                          style: TextStyle(color: Colors.black, fontSize: 11),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 4,
                        child: Container(
                            height: 30,
                            alignment: Alignment.centerLeft,
                            decoration: new BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  new BorderRadius.all(Radius.circular(12.0)),
                              border: Border.all(
                                  width: 0.6,
                                  color: Colors.grey,
                                  style: BorderStyle.solid),
                            ),
                            margin:
                                EdgeInsets.only(left: 7, right: 10, top: 10),
                            child: Directionality(
                                textDirection: TextDirection.ltr,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<Clients>(
                                      isExpanded: true,
                                      value: _nameSelectedItem,
                                      items: _nameDropdownMenuItems,
                                      onChanged: (value) {
                                        setState(() {
                                          _nameSelectedItem = value;
                                        });
                                      }),
                                )))),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            if (count != 0) {
                              count = count - 1;
                            }
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 10, left: 10, top: 10),
                          child: Icon(Icons.indeterminate_check_box_sharp),
                        )),
                    Container(
                        padding: EdgeInsets.all(7),
                        margin: EdgeInsets.only(top: 10, right: 9, left: 9),
                        decoration: new BoxDecoration(
                          color: Colors.grey,
                          borderRadius:
                              new BorderRadius.all(Radius.circular(12.0)),
                          border: Border.all(
                              width: 0.6,
                              color: Colors.grey,
                              style: BorderStyle.solid),
                        ),
                        child: Text(
                          count.toString(),
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        )),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            count = count + 1;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 10, left: 10, top: 10),
                          child: Icon(Icons.add_box),
                        )),
                  ],
                ),
                new GestureDetector(
                  onTap: () {
                    if (count > 0) {
                      updateView();
                      setState(() {
                        medicineLista = List.from(medicineLista)
                          ..add(new Medicine(
                              _nameSelectedItem.id,
                              _nameSelectedItem.name,
                              _typeSelectedItem.name,
                              count));
                      });
                      Navigator.pop(context);
                    } else {
                      Fluttertoast.showToast(
                          msg: "Please Choose Quantity",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 3);
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 34,
                    margin: EdgeInsets.only(right: 60, left: 60, top: 13),
                    decoration: new BoxDecoration(
                        color: Colors.grey,
                        borderRadius:
                            new BorderRadius.all(Radius.circular(12.0))),
                    child: Text(
                      "Add",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    // padding: EdgeInsets.all(5.0),
                  ),
                ),
              ],
            );
          });
        },
        context: context);
  }

  EditMedicineDialog(BuildContext context, Medicine medicine, int index) {
    TypeList.clear();
    medicineList.clear();
    makeupList.clear();
    TypeList.add(new Clients(1, 'Medicine'));
    TypeList.add(new Clients(2, 'Makeup'));

    medicineList.add(new Clients(1, 'Panadol'));
    medicineList.add(new Clients(2, 'Profen'));

    makeupList.add(new Clients(1, 'iShadow'));
    makeupList.add(new Clients(2, 'Eye Liner'));
    _typeDropdownMenuItems = buildDropDownMenuItems(TypeList);

    if (medicine.type == 'Medicine') {
      _typeSelectedItem = TypeList[0];

      for (int i = 0; i < medicineList.length; i++) {
        if (medicine.name == medicineList[i].name) {
          _nameDropdownMenuItems = buildDropDownMenuItems(medicineList);
          _nameSelectedItem = medicineList[i];

          break;
        }
      }
    } else {
      _typeSelectedItem = TypeList[1];

      for (int i = 0; i < makeupList.length; i++) {
        if (medicine.name == makeupList[i].name) {
          _nameDropdownMenuItems = buildDropDownMenuItems(makeupList);
          _nameSelectedItem = makeupList[i];
          break;
        }
      }
    }
    return showDialog(
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return SimpleDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(width: 0, style: BorderStyle.none)),
              children: [
                Row(
                  children: [
                    Flexible(
                      flex: 2,
                      fit: FlexFit.loose,
                      child: Container(
                        margin: EdgeInsets.only(left: 14, top: 10),
                        child: Text(
                          'Medicine Type ',
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 4,
                        child: Container(
                            height: 30,
                            alignment: Alignment.centerLeft,
                            decoration: new BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  new BorderRadius.all(Radius.circular(12.0)),
                              border: Border.all(
                                  width: 0.6,
                                  color: Colors.grey,
                                  style: BorderStyle.solid),
                            ),
                            margin:
                                EdgeInsets.only(left: 7, right: 10, top: 10),
                            child: Directionality(
                                textDirection: TextDirection.ltr,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<Clients>(
                                      isExpanded: true,
                                      value: _typeSelectedItem,
                                      items: _typeDropdownMenuItems,
                                      onChanged: (value) {
                                        setState(() {
                                          _typeSelectedItem = value;
                                          if (value.id == 2) {
                                            _nameDropdownMenuItems =
                                                buildDropDownMenuItems(
                                                    makeupList);
                                            _nameSelectedItem = makeupList[0];
                                          } else {
                                            _nameDropdownMenuItems =
                                                buildDropDownMenuItems(
                                                    medicineList);
                                            _nameSelectedItem = medicineList[0];
                                          }
                                        });
                                      }),
                                )))),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 2,
                      fit: FlexFit.loose,
                      child: Container(
                        margin: EdgeInsets.only(left: 14, top: 10),
                        child: Text(
                          'Medicine Name ',
                          style: TextStyle(color: Colors.black, fontSize: 11),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 4,
                        child: Container(
                            height: 30,
                            alignment: Alignment.centerLeft,
                            decoration: new BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  new BorderRadius.all(Radius.circular(12.0)),
                              border: Border.all(
                                  width: 0.6,
                                  color: Colors.grey,
                                  style: BorderStyle.solid),
                            ),
                            margin:
                                EdgeInsets.only(left: 7, right: 10, top: 10),
                            child: Directionality(
                                textDirection: TextDirection.ltr,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<Clients>(
                                      isExpanded: true,
                                      value: _nameSelectedItem,
                                      items: _nameDropdownMenuItems,
                                      onChanged: (value) {
                                        setState(() {
                                          _nameSelectedItem = value;
                                        });
                                      }),
                                )))),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            if (count != 0) {
                              count = count - 1;
                            }
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 10, left: 10, top: 10),
                          child: Icon(Icons.indeterminate_check_box_sharp),
                        )),
                    Container(
                        padding: EdgeInsets.all(7),
                        margin: EdgeInsets.only(top: 10, right: 9, left: 9),
                        decoration: new BoxDecoration(
                          color: Colors.grey,
                          borderRadius:
                              new BorderRadius.all(Radius.circular(12.0)),
                          border: Border.all(
                              width: 0.6,
                              color: Colors.grey,
                              style: BorderStyle.solid),
                        ),
                        child: Text(
                          count.toString(),
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        )),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            count = count + 1;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 10, left: 10, top: 10),
                          child: Icon(Icons.add_box),
                        )),
                  ],
                ),
                new GestureDetector(
                  onTap: () {
                    medicineLista[index].name = _nameSelectedItem.name;
                    medicineLista[index].type = _typeSelectedItem.name;
                    medicineLista[index].quantity = count;
                    updateView();
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 34,
                    margin: EdgeInsets.only(right: 60, left: 60, top: 13),
                    decoration: new BoxDecoration(
                        color: Colors.grey,
                        borderRadius:
                            new BorderRadius.all(Radius.circular(12.0))),
                    child: Text(
                      "Edit",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    // padding: EdgeInsets.all(5.0),
                  ),
                ),
              ],
            );
          });
        },
        context: context);
  }
}

int count = 0;
List<DropdownMenuItem<Clients>> _typeDropdownMenuItems = [];
List<DropdownMenuItem<Clients>> _nameDropdownMenuItems = [];
Clients _typeSelectedItem;
Clients _nameSelectedItem;
List<Clients> TypeList = [];
List<Clients> medicineList = [];
List<Clients> makeupList = [];

List<DropdownMenuItem<Clients>> buildDropDownMenuItems(List listItems) {
  List<DropdownMenuItem<Clients>> items = [];
  for (Clients listItem in listItems) {
    items.add(
      DropdownMenuItem(
        child: Container(
            padding: EdgeInsets.only(right: 10, left: 20),
            margin: EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              listItem.name,
              style: TextStyle(fontSize: 16),
            )),
        value: listItem,
      ),
    );
  }
  return items;
}

class Clients {
  int id;
  String name;

  Clients(this.id, this.name);

  Clients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Medicine {
  int id;
  String name;
  String type;
  int quantity;

  Medicine(this.id, this.name, this.type, this.quantity);

  Medicine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['quantity'] = this.quantity;
    return data;
  }
}
