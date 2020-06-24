import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class FavItem extends StatelessWidget {
 String id;
  final String title;
  final String duration;
  final String complexity;
  final String affordability;
  final String members;
  final String docid;
  final String imageurl;
  FavItem(
      {this.id,
      this.title,
      this.members,
      this.complexity,
      this.affordability,
      this.duration,
      this.docid,this.imageurl});
     
     String uid;
      Future returnuid() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    uid = user.uid;
  }

  Widget build(BuildContext context) {
   
   
    return SingleChildScrollView(
      child: InkWell(
        onTap: () => Navigator.of(context)
            .pushNamed('/fav_detail_screen', arguments: docid),
        child: Card(
          margin: EdgeInsets.all(20),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                      imageurl,
                      height: 100,
                      width: 80,
                      fit: BoxFit.cover,
                      alignment: Alignment.center),
                ),
              ),
              SizedBox(width: 10),
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
                        Text(members,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 12
                            ))
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
                              fontSize: 12
                            ),
                          ),
                          Icon(Icons.assignment_late),
                          Text(complexity,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 12
                              )),
                          Icon(Icons.attach_money),
                          Text(affordability,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 12
                              ))
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
