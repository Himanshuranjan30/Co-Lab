

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:projq/Providers/project.dart';
import 'package:path/path.dart';
import 'package:projq/screens/addproject.dart';
import 'package:projq/services/database.dart';
import 'package:provider/provider.dart';
class ProjectItem extends StatelessWidget {
  final String id;
  final String title;
  final String duration;
  final String complexity;
  final String affordability;
  final String members;
  
  
  
   
  
   
   ProjectItem({this.id,this.title,this.members,this.complexity,this.affordability,this.duration,});
  
   
  var database= new DatabaseService();
  
   
  
    
  
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: InkWell(
      
      onTap:()=> Navigator.of(context).pushNamed('/proj_detail_screen',arguments:id),
      child: Card(
        margin: EdgeInsets.all(8),
        color: Colors.white,
        child:
                  Row(
            children: <Widget>[
              SizedBox(width: 10),
              
              
              Text(database.photourl),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(database.photourl
                      ,
                      height: 100,
                      width: 80,
                      fit: BoxFit.cover,
                      alignment: Alignment.center),
                ),
              ),
              SizedBox(width: 20),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.people),
                      Text(members,style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,))
                      ],
                    ),
                    
                    SizedBox(height: 30),
                    ButtonBar(
                      alignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(children: <Widget>[
                          Icon(Icons.timer),
                          Text(
                            duration,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Icon(Icons.assignment_late),
                          Text(complexity,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),

                              Icon(Icons.attach_money),
                              Text(affordability,style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,))
                        ])
                      ],
                    ),
                  ])
            ],
          ),
        ),
      ),
    );
  }
}
