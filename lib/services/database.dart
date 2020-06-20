import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:projq/Providers/project.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:path/path.dart';
import 'package:projq/screens/addproject.dart';
import 'package:projq/screens/category_project_screen.dart';
import 'package:projq/widgets/image_input.dart';

class DatabaseService extends ChangeNotifier{
  final firestoreInstance = Firestore.instance;
  // collection reference
  String uid;
  String fileName;
  var addproj = new AddProject();

    String url='';
  StorageTaskSnapshot storageTaskSnapshot;

  Future<Project> updateUserData(Project project) async {
    firestoreInstance.collection('projects').add(
      {
        'id': project.id,
        'title': project.title,
        'description': project.description,
        'duration': project.duration,
        'members': project.members,
        'complexity': project.complexity,
        'affordability': project.affordability,
        'prequisites': project.prequisites,
        'contact': project.contact,
      },
    );

     fileName = basename(project.image.path);
    StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(project.image);
    
     
    String photourl =  await (await uploadTask.onComplete).ref.getDownloadURL();
    url= photourl.toString();
    notifyListeners();
    
  }

  

  List<Project> fetchProjects(QuerySnapshot snapshot) {
    return snapshot.documents.map((e) {
      return Project(
          id: e.data['id'],
          title: e.data['title'],
          description: e.data['description'],
          prequisites: e.data['prequisites'],
          complexity: e.data['complexity'],
          affordability: e.data['affordability'],
          duration: e.data['duration'],
          members: e.data['members'],
          contact: e.data['contact']);
    }).toList();
  }

  // get brews stream
  //
  Stream<List<Project>> get projects {
    var firebaseUser = FirebaseAuth.instance.currentUser();
    final CollectionReference projectCollection =
        Firestore.instance.collection('projects');
    return projectCollection.snapshots().map(fetchProjects);
  }
}
