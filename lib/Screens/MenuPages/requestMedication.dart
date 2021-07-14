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
List<Medicine> _medicineList = dataMedicine();
List<MedicineType> _type = dataMedicineType();
List<SelectedMedicine> _selectedMedicine = [];
List<String> _deliveryOption = ["to by agreed later" , "Delivery to me " , "Receive it from anywhere"];
String _deliveryMethod ;

class _RequestMedicationState extends State<RequestMedication> {

  TextEditingController messageController = new TextEditingController();

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
                              addMedicineDialog(context, '');
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
                            itemCount: _selectedMedicine.length,
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
                                                image: AssetImage("images/medicine/"+_selectedMedicine[index].image+".jpg"),
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
                                                      _selectedMedicine[index].name,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18),
                                                    )),
                                                Container(
                                                    margin: EdgeInsets.all(2),
                                                    child: Text(
                                                      _selectedMedicine[index].type,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18),
                                                    )),
                                                Container(
                                                    margin: EdgeInsets.all(3),
                                                    child: Text(
                                                      _selectedMedicine[index]
                                                          .quantity,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18),
                                                    )),
                                              ],
                                            ))
                                      ],
                                    ),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Flexible(
                                              flex: 1,
                                              fit: FlexFit.loose,
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    _selectedMedicine = List.from(_selectedMedicine)..removeAt(index);
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
                                                  editMedicineDialog(context, index);
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
                          child: _deliveryOption != null
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
                              items: _deliveryOption.map((String dropdownItems) {
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
  addMedicineDialog(BuildContext context, String message) {
    MedicineType _medicineTypeSelected ;
    Medicine _medicineSelected ;
    int _count = 1;
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
                            //height: 30,
                            alignment: Alignment.centerLeft,
                            decoration: new BoxDecoration(
                              color: Color(0xffcee8f9),
                              borderRadius:
                              new BorderRadius.all(Radius.circular(12.0)),
                              border: Border.all(
                                  width: 0.6,
                                  color: Colors.grey,
                                  style: BorderStyle.solid),
                            ),
                            margin: EdgeInsets.only(left: 7, right: 10, top: 10),
                            padding: EdgeInsets.only(left: 7),
                            child: Directionality(
                                textDirection: TextDirection.ltr,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<MedicineType>(
                                      isExpanded: true,
                                      value: _medicineTypeSelected,
                                      items:  _type.map((MedicineType dropdownItems) {
                                        return DropdownMenuItem<MedicineType>(
                                          child: Text(dropdownItems.name),
                                          value: dropdownItems,
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          _medicineTypeSelected = value;
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
                            //height: 30,
                            alignment: Alignment.centerLeft,
                            decoration: new BoxDecoration(
                              color: Color(0xffcee8f9),
                              borderRadius:
                              new BorderRadius.all(Radius.circular(12.0)),
                              border: Border.all(
                                  width: 0.6,
                                  color: Colors.grey,
                                  style: BorderStyle.solid),
                            ),
                            margin: EdgeInsets.only(left: 7, right: 10, top: 10),
                            padding: EdgeInsets.only(left: 7),
                            child: Directionality(
                                textDirection: TextDirection.ltr,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<Medicine>(
                                      isExpanded: true,
                                      value: _medicineSelected,
                                      items: _medicineList.map((Medicine dropdownItems) {
                                        return DropdownMenuItem<Medicine>(
                                          child: Text(dropdownItems.name),
                                          value: dropdownItems,
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          _medicineSelected = value;
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
                            if (_count != 1) {
                              _count = _count - 1;
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
                          color: Color(0xffcee8f9),
                          borderRadius:
                          new BorderRadius.all(Radius.circular(12.0)),
                          border: Border.all(
                              width: 0.6,
                              color: Colors.grey,
                              style: BorderStyle.solid),
                        ),
                        child: Text(
                          _count.toString(),
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        )),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            _count = _count + 1;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 10, left: 10, top: 10),
                          child: Icon(Icons.add_box),
                        )),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    if (_count > 0) {
                      updateView();
                      setState(() {
                        _selectedMedicine.add(SelectedMedicine(_medicineSelected.name, _medicineSelected.image,
                            _count.toString(), _medicineTypeSelected.name, _medicineSelected.id, _medicineTypeSelected.id));
                        // medicineLista = List.from(medicineLista)
                        //   ..add(new Medicine(
                        //       _nameSelectedItem.id,
                        //       _nameSelectedItem.name,
                        //       _typeSelectedItem.name,
                        //       count));
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
                        color: Color(0xffcee8f9),
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
  editMedicineDialog(BuildContext context, int index) {
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
                            alignment: Alignment.centerLeft,
                            decoration: new BoxDecoration(
                              color: Color(0xffcee8f9),
                              borderRadius:
                              new BorderRadius.all(Radius.circular(12.0)),
                              border: Border.all(
                                  width: 0.6,
                                  color: Color(0xff6a77d0),
                                  style: BorderStyle.solid),
                            ),
                            margin: EdgeInsets.only(left: 7, right: 10, top: 10),
                            padding: EdgeInsets.only(left: 7),
                            child: Directionality(
                                textDirection: TextDirection.ltr,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<MedicineType>(
                                      isExpanded: true,
                                      value: _type[_selectedMedicine[index].typeIndex],
                                      items: _type.map((MedicineType dropdownItems) {
                                        return DropdownMenuItem<MedicineType>(
                                          child: Text(dropdownItems.name),
                                          value: dropdownItems,
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedMedicine[index].typeIndex = value.id;
                                          _selectedMedicine[index].type = value.name;
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
                            //height: 30,
                            alignment: Alignment.centerLeft,
                            decoration: new BoxDecoration(
                              color: Color(0xffcee8f9),
                              borderRadius:
                              new BorderRadius.all(Radius.circular(12.0)),
                              border: Border.all(
                                  width: 0.6,
                                  color: Colors.grey,
                                  style: BorderStyle.solid),
                            ),
                            margin: EdgeInsets.only(left: 7, right: 10, top: 10),
                            padding: EdgeInsets.only(left: 7),
                            child: Directionality(
                                textDirection: TextDirection.ltr,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<Medicine>(
                                      isExpanded: true,
                                      value: _medicineList[_selectedMedicine[index].medicineIndex],
                                      items: _medicineList.map((Medicine dropdownItems) {
                                        return DropdownMenuItem<Medicine>(
                                          child: Text(dropdownItems.name),
                                          value: dropdownItems,
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedMedicine[index].medicineIndex = value.id;
                                          _selectedMedicine[index].image = value.image;
                                          _selectedMedicine[index].name = value.name;
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
                            int count = int.parse(_selectedMedicine[index].quantity);
                            if (count != 1) {
                              count = count - 1;
                              _selectedMedicine[index].quantity = count.toString();
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
                          color: Color(0xffcee8f9),
                          borderRadius:
                          new BorderRadius.all(Radius.circular(12.0)),
                          border: Border.all(
                              width: 0.6,
                              color: Colors.grey,
                              style: BorderStyle.solid),
                        ),
                        child: Text(
                          _selectedMedicine[index].quantity,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        )),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            int count = int.parse(_selectedMedicine[index].quantity);
                            count = count + 1;
                            _selectedMedicine[index].quantity = count.toString();
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
                    updateView();
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 34,
                    margin: EdgeInsets.only(right: 60, left: 60, top: 13),
                    decoration: new BoxDecoration(
                        color: Color(0xffcee8f9),
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

class MedicineType {
  int id;
  String name;
  MedicineType(this.id, this.name);
  MedicineType.fromJson(Map<String, dynamic> json) {
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
  String image;

  Medicine(this.id, this.name , this.image);
  Medicine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}
class SelectedMedicine {
  String name;
  String image;
  String quantity;
  String type;
  int medicineIndex;
  int typeIndex;
  SelectedMedicine(this.name, this.image , this.quantity , this.type, this.medicineIndex,this.typeIndex);
  SelectedMedicine.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    quantity = json['quantity'];
    type = json['type'];
    medicineIndex = json['medicineIndex'];
    typeIndex = json['typeIndex'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['quantity'] = this.quantity;
    data['type'] = this.type;
    data['medicineIndex'] = this.medicineIndex;
    data['typeIndex'] = this.typeIndex;
    return data;
  }
}
List<MedicineType> dataMedicineType() {
  MedicineType t0 = MedicineType(0 , "Tap");
  MedicineType t1 = MedicineType(1 , "Injection" );
  MedicineType t2 = MedicineType(2 , "Box");
  MedicineType t3 = MedicineType(3 , "Sparkling");
  MedicineType t4 = MedicineType(4 , "Cream");
  MedicineType t5 = MedicineType(5 , "Drinks");
  MedicineType t6 = MedicineType(6 , "droplet");
  return  [t0,t1,t2,t3,t4,t5,t6];
}
List<Medicine> dataMedicine() {
  Medicine t0 = Medicine(0 , "ALPHINTERN 30/TAB" , "1");
  Medicine t1 = Medicine(1 , "CONCOR 5 PLUS 30/TAB" , "2");
  Medicine t2 = Medicine(2 , "PRISOLINE EYE DROPS 15ML" , "3");
  Medicine t3 = Medicine(3 , "DIMRA 20 TAB" , "4");
  Medicine t4 = Medicine(4 , "GALVUS MET 50/850MG 30/TAB" , "5");
  Medicine t5 = Medicine(5 , "DIAMICRON 30MR 30/TAB" , "6");
  Medicine t6 = Medicine(6 , "BRUFEN 600MG 30 TAB" , "7");
  Medicine t7 = Medicine(7 , "ULTI-PLUS SOLUTION 240ML" , "8");
  Medicine t8 = Medicine(8 , "Janumet 50/1000mg" , "9");
  Medicine t9 = Medicine(9 , "PANADOL ADVANCE BLUE 24 TAB" , "10");
  Medicine t10 = Medicine(10 , "VIDROP 2800IU/ML ORAL DROPS 15ML" , "11");
  Medicine t11 = Medicine(11 , "URIVIN 10 SACHETS" , "12");
  Medicine t12 = Medicine(12 , "BECOZYME 12/AMP 2ML" , "13");
  Medicine t13 = Medicine(13 , "TAVANIC 500MG/100ML 1 VIAL" , "14");
  Medicine t14 = Medicine(14 , "PRAVOTIN 30/SACH" , "15");
  Medicine t15 = Medicine(15 , "DUPHALAC SYRUP 200ML " , "16");
  Medicine t16 = Medicine(16 , "HIBIOTIC 1000MG 16 TAB" , "17");
  Medicine t17 = Medicine(17 , "MAXICAL 30 TAB" , "18");
  Medicine t18 = Medicine(18 , "MEBO 0.25% OINT 15GM" , "19");
  Medicine t19 = Medicine(19 , "DICLAC 150MG ID 10/TAB" , "20");
  return  [t0,t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,t15,t16,t17,t18,t19];
}
