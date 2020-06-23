




import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:projq/services/database.dart';
import 'package:projq/shared/loading.dart';
import 'package:projq/widgets/fav_item.dart';
import 'package:projq/widgets/proj_item.dart';

class FavList extends StatefulWidget {
  @override
  _FavListState createState() => _FavListState();
}
 String uid;
 Future returnuid() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    uid = user.uid;
  }
bool loading= false;
class _FavListState extends State<FavList> {
  
 
  @override
  Widget build(BuildContext context) {
    
    returnuid();
    return StreamBuilder(
        stream: Firestore.instance.collection(uid).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            Text('loading.....');
          };
          return ListView.builder(
            itemBuilder: (ctx, index) {
              return FavItem(
                id: snapshot.data.documents[index]['id'],
                title: snapshot.data.documents[index]['title'],
                members: snapshot.data.documents[index]['members'],
                complexity: snapshot.data.documents[index]['complexity'],
                affordability: snapshot.data.documents[index]['affordability'],
                duration: snapshot.data.documents[index]['duration'],
                docid: snapshot.data.documents[index].documentID,
                imageurl: snapshot.data.documents[index]['imageurl']
          , 
                
                
              );
            },
            itemCount: snapshot.data.documents.length,
          );
         
        });
  }
}
