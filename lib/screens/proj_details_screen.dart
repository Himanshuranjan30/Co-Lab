

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projq/Providers/project.dart';
import 'package:projq/Providers/projects.dart';
import 'package:provider/provider.dart';

class ProjectDetailScreen extends StatelessWidget {
  static const routeName = '/proj_detail_screen';
  String id;
    Project selectedproj;
  Future<void> fetchproject(String groupId) async {
    
        await Firestore.instance.collection("projects").document(id).get().then((doc) => {selectedproj.description=doc.data['description'],
        selectedproj.prequisites=doc.data['prequisites'],selectedproj.contact= doc.data['contact'],});
        
        
        
        
        
        
        
      
    }
  
  
  
  
  
  Widget build(BuildContext context) {
     id = ModalRoute.of(context).settings.arguments;
     fetchproject(id);
    

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo
          ,title: Text(selectedproj.title),
          actions: <Widget>[Icon(Icons.delete)],
        ),
        body: Column(children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                child: Card(
                  child: Image.file(selectedproj.image),
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
                      child: Text(selectedproj.description,
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
                      child: Text(selectedproj.prequisites,
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
                      child: Text(selectedproj.contact,
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
