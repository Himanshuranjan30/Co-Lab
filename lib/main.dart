import 'package:flutter/material.dart';
import 'package:projq/Providers/project.dart';
import 'package:projq/Providers/projects.dart';
import 'package:projq/screens/addproject.dart';
import 'package:projq/screens/wrapper.dart';
import 'package:projq/services/auth.dart';
import 'package:projq/services/database.dart';

import 'package:projq/screens/proj_details_screen.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: Projects()),
          StreamProvider.value(value: AuthService().user),
          StreamProvider<List<Project>>.value(value: DatabaseService().projects),
          ChangeNotifierProvider.value(value: DatabaseService())
          
        ],
        child: Consumer<Projects>(
            builder: (ctx, auth, _) => MaterialApp(
                  title: 'Flutter Demo',
                  home: Wrapper(),
                  routes: {
                    '/proj_detail_screen': (ctx) => ProjectDetailScreen(),
                    '/proj_add_screen': (ctx) => AddProject(),
                  },
                )));
  }
}
