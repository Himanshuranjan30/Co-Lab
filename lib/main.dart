import 'package:flutter/material.dart';
import 'package:projq/Providers/projects.dart';
import 'package:projq/screens/addproject.dart';


import 'package:projq/screens/category_project_screen.dart';
import 'package:projq/screens/proj_details_screen.dart';
import 'package:provider/provider.dart';
import './screens/tabs_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  
  
  @override
  Widget build(BuildContext context) {
    
    
    return ChangeNotifierProvider.value(





      value: Projects()
                ,
       child: Consumer<Projects>(
        builder: (ctx, auth, _) => MaterialApp(
      title: 'Flutter Demo',
      
      home: TabsScreen(),
      routes: {
        
        '/project_details_screen': (ctx)=> ProjectDetailScreen(),
        '/proj_add_screen': (ctx)=> AddProject(),
      },
    )));
  }
}
