import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projq/Providers/project.dart';
import 'package:projq/services/database.dart';
import 'package:projq/shared/loading.dart';
import 'package:provider/provider.dart';

class ProjectDetailScreen extends StatefulWidget {
  

  @override
  _ProjectDetailScreenState createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _showScaffold(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
  String fid;
 String id;

  Project selectedproj;

  String finalurl;

  String uid;

  String imagename;

  Future returnuid() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    uid = user.uid;
  }

  final firestoreInstance = Firestore.instance;

  final FirebaseStorage storage =
      FirebaseStorage(storageBucket: 'gs://projfire-d9f08.appspot.com');

     
      


  Widget build(BuildContext context) {
    returnuid();
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String,String>;
    id= routeArgs['docid'];
    fid= routeArgs['id'];

    imagename = Provider.of<DatabaseService>(context).fileName;
    


    return StreamBuilder(
        stream:
            Firestore.instance.collection('projects').document(id).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
         
         Text('loading');
         
          }
        
          

          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.indigo,
                title: Text(snapshot.data['title']),
                actions: <Widget>[
                  uid == snapshot.data['uid']
                      ? IconButton(
                          icon: Icon(
                            Icons.delete,
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                            await Firestore.instance
                                .collection('projects')
                                .document(id)
                                .delete();
                            storage.ref().child(imagename).delete();
                          })
                      : Container(width: 0,height: 0,)
                ],
              ),
              body: SingleChildScrollView(
                child: Column(children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        child: Card(
                          child: Image.network(
                            snapshot.data['imageurl'],
                            fit: BoxFit.fill,
                          ),
                          margin: EdgeInsets.all(8),
                        ),
                        height: 200,
                        width: 200,
                      ),
                      SizedBox(width: 20),
                      FloatingActionButton(
                        backgroundColor: Colors.indigo,
                        onPressed: null,
                        child: Icon(Icons.check_circle),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      FloatingActionButton(
                        child: Icon(Icons.favorite),
                        onPressed: () async {
                          
                          
                         
                          await firestoreInstance
                              .collection(uid)
                              .document(fid)
                              .setData(
                            {
                              
                              'id': snapshot.data['id'],
                              'title': snapshot.data['title'],
                              'description': snapshot.data['description'],
                              'duration': snapshot.data['duration'],
                              'members': snapshot.data['members'],
                              'complexity': snapshot.data['complexity'],
                              'affordability': snapshot.data['affordability'],
                              'prequisites': snapshot.data['prequisites'],
                              'contact': snapshot.data['contact'],
                              'imageurl': snapshot.data['imageurl'],
                            },
                          );
                          
                           showDialog(
      context: context,
      builder: (_){
        return AlertDialog(title: Text('added to favs!'),);
      },
    );
                        },
                        backgroundColor: Colors.indigo,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 10,
                              ),
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
                                border: Border.all(width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            alignment: Alignment.topLeft,
                            child: Card(
                              child: Text(snapshot.data['description'],
                                  style: TextStyle(
                                      fontSize: 15,
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
                            children: <Widget>[
                              SizedBox(
                                width: 10,
                              ),
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
                                border: Border.all(width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            alignment: Alignment.topLeft,
                            child: Card(
                              child: Text(snapshot.data['prequisites'],
                                  style: TextStyle(
                                      fontSize: 15,
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
                            children: <Widget>[
                              SizedBox(
                                width: 10,
                              ),
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
                                border: Border.all(width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            alignment: Alignment.topLeft,
                            child: Card(
                              child: Text(snapshot.data['contact'],
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FontStyle.italic)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ));
        });
  }
}
