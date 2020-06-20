
import 'dart:io';


import 'package:flutter/foundation.dart';


class Project with ChangeNotifier {
  final String id;
   String title;
   String description;
   String prequisites;
  final File image;
 String contact;
  final String members;
  
  final String duration;
  final String affordability;
  final String complexity;

  Project( {
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.prequisites,
    this.image,
    this.contact,
    this.members,
    
    this.duration,
    this.affordability,
    this.complexity,}
  );

  

}