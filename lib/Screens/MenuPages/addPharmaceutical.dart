import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:terapia_app/Screens/MenuPages/requestMedication.dart';
import 'package:terapia_app/Widgets/appBarWithBack.dart';
import 'package:file_picker/file_picker.dart' as picker;

class AddPharmaceutical extends StatefulWidget {
  @override
  _AddPharmaceuticalState createState() => _AddPharmaceuticalState();
}

class _AddPharmaceuticalState extends State<AddPharmaceutical> {
  TextEditingController marketNameController = new TextEditingController();
  TextEditingController effectiveMaterialNameController = new TextEditingController();

  FocusNode marketNameNode = new FocusNode();
  FocusNode effectiveMaterialNameNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
     appBar: AppBarWithBack(
        height: 184,
        title: "Request Medication",
    ),
    body: Container(      decoration: BoxDecoration(color: Color(0xFFcee8f9)),

      child: Column(children: [
       Container(alignment:Alignment.centerLeft,width:MediaQuery.of(context).size.width,

        margin: EdgeInsets.only(left: 21,top: 15),
        child: Text('Trade name of the medicine'
          ,textAlign: TextAlign.start,style: TextStyle(color: Colors.black,fontSize: 18),),),

      Container(alignment:Alignment.centerLeft,width:MediaQuery.of(context).size.width,
        decoration: BoxDecoration(borderRadius: new BorderRadius.all(Radius.circular(9.0)) ,
        color: Color(0xffc6cbd1)),
        margin: EdgeInsets.only(top:10,right: 29,left: 25),
        child: new TextField(
//                      cursorColor: white,
          keyboardType: TextInputType.text,
          controller: marketNameController,
          minLines: 1,maxLines: 1,
          focusNode: marketNameNode,
          onSubmitted: (v) {
            FocusScope.of(context).requestFocus(effectiveMaterialNameNode);
          },
          textAlign: TextAlign.start,
          textInputAction: TextInputAction.next,
          style: TextStyle(color: Colors.black),
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderSide:
              BorderSide(width: 0.4, style: BorderStyle.solid),
              borderRadius: const BorderRadius.all(
                const Radius.circular(
                  9.0,
                ),
              ),
            ),
            // hintText: "الموضوع",
            // fillColor: Color(0xffEFEFEF),
            // filled: true,
            contentPadding: EdgeInsets.only(left: 9, right: 9,top: 7),
          ),
        ),),
        Container(alignment:Alignment.centerLeft,width:MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(left: 21,top: 15),
          child: Text('Effective Material of the medicine'
            ,textAlign: TextAlign.start,style: TextStyle(color: Colors.black,fontSize: 18),),),

        Container(alignment:Alignment.centerLeft,width:MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top:10,right: 29,left: 25),

          decoration: BoxDecoration(borderRadius: new BorderRadius.all(Radius.circular(9.0))  ,
              color: Color(0xffc6cbd1)),
          child: new TextField(
//                      cursorColor: white,
            keyboardType: TextInputType.text,
            controller: effectiveMaterialNameController,
            minLines: 1,maxLines: 1,
            focusNode: effectiveMaterialNameNode,
            // onSubmitted: (v) {
            //   FocusScope.of(context).requestFocus(effectiveMaterialNameNode);
            // },
            textAlign: TextAlign.start,
            textInputAction: TextInputAction.next,
            style: TextStyle(color: Colors.black),
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide:
                BorderSide(width: 0.4, style: BorderStyle.solid),
                borderRadius: const BorderRadius.all(
                  const Radius.circular(
                    9.0,
                  ),
                ),
              ),
              // hintText: "الموضوع",
              // fillColor: Color(0xffEFEFEF),
              // filled: true,
              contentPadding: EdgeInsets.only(left: 9, right: 9,top: 7),
            ),
          ),),
        Container(alignment:Alignment.centerLeft,width:MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(left: 21,top: 15),
          child: Text('Medicine Type '
            ,textAlign: TextAlign.start,style: TextStyle(color: Colors.black,fontSize: 18),),),

          Container(
            height: 44,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.centerLeft,
             decoration: new BoxDecoration(color: Color(0xffc6cbd1),
              borderRadius: new BorderRadius.all(Radius.circular(9.0)) ,
              border: Border.all(
                  width: 0.6, color: Colors.grey, style: BorderStyle.solid),
            ),
            margin: EdgeInsets.only(left: 23, right: 27, top: 10),
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
                        });
                      }),
                ))),
        Container(alignment:Alignment.centerRight,width:MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(right: 21,top: 15),
          child: Text('Medicine Image '
            ,textAlign: TextAlign.start,style: TextStyle(color: Colors.black,fontSize: 18),),),
          
          Row(children: [
            Expanded(child: Container(height: 140,width: 100,
                 margin: EdgeInsets.only(left: 21)
                ,alignment: Alignment.topCenter
                ,child: Row(children: [
                  Text('Max size is 2 mb'),
                  Icon(Icons.upload_sharp)
                ],))),
              Expanded(child:  GestureDetector(onTap: () {
                _openFileExplorer();
              },child:Container(height: 140,width: 100,
                  margin: EdgeInsets.only(right: 35,left: 35,top: 9),
                  decoration: BoxDecoration(color: Colors.white,
                    border: Border.all(
                        width: 0.6, color: Colors.grey, style: BorderStyle.solid),
                  )
                  ,alignment: Alignment.center
                  ,child: Image(image:imagePath!= null?FileImage(File(imagePath),):
                  AssetImage('images/big_camera.png'),width: 80,height: 80
                    ,alignment: Alignment.center,fit: BoxFit.cover,)))),

          ],),
        Container(padding: EdgeInsets.all(11),
            width: 160,
            margin:EdgeInsets.only(top: 19,right: 9,left: 9,bottom: 12),
            alignment: Alignment.center,
            decoration: new BoxDecoration(
                color: Color(0xff374761),
                borderRadius:
                BorderRadius.circular(13)),
            child: Text('Send', style: TextStyle(color: Colors.white,fontSize: 18)
              , textAlign: TextAlign.center,)),

      ],),
    )

    ));
  }
  Uint8List fileBytes;
  File file;
  var _paths,_loadingPath = false;
  var _directoryPath,_pickingType,_fileName = '';
  picker.FilePickerResult result;
  void _openFileExplorer() async {
    setState(() => _loadingPath = true);
    try {
      _directoryPath = null;
      result = await picker.FilePicker.platform.pickFiles(
        type: picker.FileType.custom,withReadStream: true,
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
      _fileName = result != null ? result.files.length>0?result.files.first.name : '':'';

    });
  }
  var imagePath;
  List<DropdownMenuItem<Clients>> _typeDropdownMenuItems = [];
  Clients _typeSelectedItem;
  List<Clients> TypeList = [];

  @override
  void initState() {
    TypeList.add(new Clients(1, 'Medicine'));
    TypeList.add(new Clients(2, 'Makeup'));
    _typeDropdownMenuItems = buildDropDownMenuItems(TypeList);
    _typeSelectedItem = TypeList[0];
     super.initState();
  }

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

}
