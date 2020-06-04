import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProjectItem extends StatelessWidget





{
  
  
  String id;
  String title;
  String duration;
  ProjectItem(this.id,this.title,this.duration);
  
  Widget build(BuildContext context)
  {

    return InkWell(child: ListTile(contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: new BoxDecoration(
              border: new Border(
                  right: new BorderSide(width: 1.0, color: Colors.white24))),
        ),
        title: Text(title),
        subtitle: Text(duration),
    ),)
;        
  }
}