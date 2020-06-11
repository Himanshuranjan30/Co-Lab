import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projq/Providers/projects.dart';
import 'package:provider/provider.dart';

class ProjectDetailScreen extends StatelessWidget {
  static const routeName = '/proj_detail_screen';
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final selectedProject = Provider.of<Projects>(
      context,
    ).findById(id);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo
          ,title: Text(selectedProject.title),
          actions: <Widget>[Icon(Icons.delete)],
        ),
        body: Column(children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                child: Card(
                  child: Image.file(selectedProject.image),
                  margin: EdgeInsets.all(8),
                ),
                height: 200,
                width: 200,
              ),
            SizedBox(width:20),
            FloatingActionButton(onPressed: null,child: Icon(Icons.check_circle),)
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: <Widget>[SizedBox(width: 10,)
                      ,
                      Text('About the Project:',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    alignment: Alignment.topLeft,
                    child: Card(
                      child: Text(selectedProject.description,
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic)),
                      
                    ),
                  ),
                ),
              ],
            ),
          ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: <Widget>[SizedBox(width: 10,)
                      ,
                      Text('Prequisites:',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    alignment: Alignment.topLeft,
                    child: Card(
                      child: Text(selectedProject.prequisites,
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic)),
                      
                    ),
                  ),
                ),
              ],
          ),
            ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: <Widget>[SizedBox(width: 10,)
                      ,
                      Text('Contact Info:',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    alignment: Alignment.topLeft,
                    child: Card(
                      child: Text(selectedProject.contact,
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic)),
                      
                    ),
                  ),
                ),
              ],
          ),
           ),
        ]));
  }
}
