import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProjectItem extends StatelessWidget {
  String id;
  String title;
  String duration;
  File image;
  String complexity;
  String affordability;
  String members;
  ProjectItem(this.id, this.title, this.duration, this.image,
      this.complexity, this.affordability,this.members);

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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.file(
                      image,
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
