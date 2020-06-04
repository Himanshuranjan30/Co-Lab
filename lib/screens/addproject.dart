import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projq/Providers/projects.dart';
import 'package:provider/provider.dart';
import '../Providers/project.dart';

class AddProject extends StatefulWidget {
  static const routeName = '/proj_add_screen';

  @override
  _AddProjectState createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  Widget build(BuildContext context) {
    final proj_nameController = TextEditingController();
    final proj_desciption = TextEditingController();
    final proj_membersno = TextEditingController();
    final proj_skillscontroller = TextEditingController();
    final proj_duration = TextEditingController();
    final proj_contactinfo = TextEditingController();

    void onSave() {
      
      Project savedproj=Project(id: DateTime.now().toString(), title: proj_nameController.text,description:proj_desciption.text,prequisites:proj_skillscontroller.text,duration:proj_duration.text);
      
      
      Provider.of<Projects>(context, listen: false).addProduct(savedproj);
        
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Add a product'),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.save,
              ),
              onPressed: () {
                onSave();
                Navigator.pop(context);
              })
        ],
      ),
      body: Column(children: <Widget>[
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
        )
      ]),
    );
  }
}
