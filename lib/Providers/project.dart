import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Project with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final String prequisites;
  final File image;
  final String contact;
  final String members;
  
  final String duration;
  final String affordability;
  final String complexity;

  Project({
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