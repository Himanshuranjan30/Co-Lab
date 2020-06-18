import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:projq/services/database.dart';


class ProjectList extends StatefulWidget {
  @override
  _ProjectListState createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  
  

  
 var databaseser= new DatabaseService();
  
  
  
  
  
  @override
  Widget build(BuildContext context) {
   
    return StreamBuilder(
      
      stream: Firestore.instance.collection('projects').snapshots(),
       builder: (context,snapshot){


         if(!snapshot.hasData)
         return Text('data is loading');
         return Center(child: Text(snapshot.data.documents[0]['title']),);
       }
    );}
      
     


                          
                  
  
}
