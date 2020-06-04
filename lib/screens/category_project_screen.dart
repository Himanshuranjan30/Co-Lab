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
  Projects projects;
  Future getList;
  
  void didChangeDependencies()
  {
    final projlist= Provider.of<Projects>(context);
    
    if(this.projects!=projlist){
    this.projects=projlist;
    
    getList= projlist.fetchAndSetProducts();}
    super.didChangeDependencies();
  }
  
  @override
  Widget build(BuildContext context)
  {
    List<Project> projdata= Provider.of<Projects>(context).items;
    
    return FutureBuilder (
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<Projects>(
                child: Center(
                  child: const Text('No PROJECTS YET'),
                ),
                builder: (ctx, projList, ch) => projList.items.length <= 0
                    ? ch
                    : GridView.builder(
                              itemCount:
                                  Provider.of<Projects>(context).items.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                
                                
                              ),
                        
                        
                        itemBuilder: (ctx, i){



                           return 
                                                                   Container(
                                        child: ProjectItem(
                                      Provider.of<Projects>(context,listen: false).items[i].title,
                                      Provider.of<Projects>(context,listen: false)
                                          .items[i]
                                          .title,Provider.of<Projects>(context,listen: false)
                                          .items[i].duration,
                                    ),);
                        })),




      future: getList,
    );
    }      
}
