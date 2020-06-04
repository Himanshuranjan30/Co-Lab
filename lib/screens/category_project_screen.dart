import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projq/Providers/project.dart';
import 'package:projq/Providers/projects.dart';
import 'package:projq/widgets/proj_item.dart';
import 'package:provider/provider.dart';

class ProjectList extends StatefulWidget
{
  @override
  _ProjectListState createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  
  List<Project> projdata;
  
  
  void initState()
  {
    projdata= Provider.of<Projects>(context).items;
    super.initState();
  }
  
  
  
 
  
  
  
  
  @override
  Widget build(BuildContext context)
  {
    
    
    
    return ListView.builder(itemCount:projdata.length ,     itemBuilder: (BuildContext context,int index){


      return ProjectItem(projdata[index].id,projdata[index].title,projdata[index].duration,);
    }
    );
    }      
}
