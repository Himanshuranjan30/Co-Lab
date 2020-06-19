import 'dart:io';

import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

import 'package:path/path.dart';
import '../Providers/project.dart';
import '../widgets/image_input.dart';
import '../services/database.dart';

class AddProject extends StatefulWidget {
  static const routeName = '/proj_add_screen';

  @override
  AddProjectState createState() => AddProjectState();
}

class AddProjectState extends State<AddProject> {
  File _pickedImage;

  String filename;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  var databaseService = new DatabaseService();
  void adddata() async {
    Project savedproj = Project(
      id: DateTime.now().toString(),
      title: proj_nameController.text,
      description: proj_desciption.text,
      prequisites: proj_skillscontroller.text,
      duration: proj_duration.text,
      image: _pickedImage,
      complexity: _myActivity,
      affordability: _myActivity1,
      contact: proj_contactinfo.text,
      members: proj_membersno.text,
    );

    await databaseService.updateUserData(savedproj);
  }

  String _myActivity;
  String _myActivity1;
  final proj_nameController = TextEditingController();
  final proj_desciption = TextEditingController();
  final proj_membersno = TextEditingController();
  final proj_skillscontroller = TextEditingController();
  final proj_duration = TextEditingController();
  final proj_contactinfo = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Add a product'),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.save,
              ),
              onPressed: () {
                adddata();
                Navigator.pop(context);
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.book), labelText: 'Project Name'),
              controller: proj_nameController,
              keyboardType: TextInputType.multiline,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(
                    Icons.description,
                  ),
                  labelText: 'description'),
              controller: proj_desciption,
              keyboardType: TextInputType.multiline,
              maxLines: 5,
            ),
            TextFormField(
                decoration: const InputDecoration(
                    icon: Icon(Icons.people), labelText: 'Members Count'),
                controller: proj_membersno,
                keyboardType: TextInputType.multiline),
            TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.code), labelText: 'Skills Required'),
              controller: proj_skillscontroller,
              keyboardType: TextInputType.multiline,
              maxLines: 5,
            ),
            TextFormField(
                decoration: const InputDecoration(
                    icon: Icon(Icons.timer), labelText: 'Duration'),
                controller: proj_duration,
                keyboardType: TextInputType.multiline),
            TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.contacts), labelText: 'Contact Info'),
              controller: proj_contactinfo,
              keyboardType: TextInputType.multiline,
              maxLines: 3,
            ),
            Row(
              children: <Widget>[
                SizedBox(width: 5),
                Icon(Icons.image),
                Expanded(child: ImageInput(_selectImage)),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            DropDownFormField(
              titleText: 'Complexity',
              hintText: 'Please choose one',
              value: _myActivity,
              onSaved: (value) {
                setState(() {
                  _myActivity = value;
                });
              },
              onChanged: (value) {
                setState(() {
                  _myActivity = value;
                });
              },
              dataSource: [
                {
                  "display": "Simple",
                  "value": "Simple",
                },
                {
                  "display": "Challenging",
                  "value": "Challenging",
                },
                {
                  "display": "Hard",
                  "value": "Hard",
                },
              ],
              textField: 'display',
              valueField: 'value',
            ),
            DropDownFormField(
              titleText: 'Affordability',
              hintText: 'Please choose one',
              value: _myActivity1,
              onSaved: (value) {
                setState(() {
                  _myActivity1 = value;
                });
              },
              onChanged: (value) {
                setState(() {
                  _myActivity1 = value;
                });
              },
              dataSource: [
                {
                  "display": "Affordable",
                  "value": "Affordable",
                },
                {
                  "display": "Luxurious",
                  "value": "Luxurious",
                },
                {
                  "display": "Pricey",
                  "value": "Pricey",
                },
              ],
              textField: 'display',
              valueField: 'value',
            )
          ]),
        ),
      ),
    );
  }
}
