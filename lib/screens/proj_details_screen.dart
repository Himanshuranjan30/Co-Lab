

import 'package:flutter/widgets.dart';
import 'package:projq/Providers/projects.dart';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProjectDetailScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    final projId = ModalRoute.of(context).settings.arguments as String;
    final selectedproj = Provider.of<Projects>(context).findById(projId);
    return Scaffold(
      appBar: AppBar(title: Text('${selectedproj.title}')),
      body: Column(children: <Widget>[
        Container(
          height: 300,
          width: double.infinity,
          child: Image.network(selectedproj.imageUrl, fit: BoxFit.cover),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Ingredients',
            style: Theme.of(context).textTheme.title,
          ),
        ),
        Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            height: 100,
            width: 300,
            child: ListView.builder(
              itemBuilder: (ctx, index) => Card(
                color: Theme.of(context).accentColor,
                child: Text(selectedproj.prequisites[index]),
              ),
              itemCount: selectedproj.prequisites.length,
            ))
      ]),
    );
  }
}
