

import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projq/screens/Authenticate/authenticate.dart';
import 'package:projq/screens/addproject.dart';

import 'package:projq/services/database.dart';
import 'package:projq/widgets/proj_item.dart';

class ProjectList extends StatefulWidget {
  @override
  _ProjectListState createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  var databaseser = new DatabaseService();
 
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Firestore.instance.collection('projects').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Text('data is loading');
          return ListView.builder(
            itemBuilder: (ctx, index) {
              return ProjectItem(
                id: snapshot.data.documents[index]['id'],
                title: snapshot.data.documents[index]['title'],
                members: snapshot.data.documents[index]['members'],
                complexity: snapshot.data.documents[index]['complexity'],
                affordability: snapshot.data.documents[index]['affordability'],
                duration: snapshot.data.documents[index]['duration'],
                docid: snapshot.data.documents[index].documentID,
                
                
              );
            },
            itemCount: snapshot.data.documents.length,
          );
        });
  }
}
