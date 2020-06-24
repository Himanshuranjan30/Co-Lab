import 'package:flutter/material.dart';
import 'package:projq/screens/fav_detailsscreen.dart';
import 'package:projq/screens/fav_list.dart';



import './category_project_screen.dart';
import './addproject.dart';

import '../services/auth.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();

    return DefaultTabController(
      length: 2,
      // initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AddProject.routeName);
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.input),
              onPressed: () async {
                await _auth.signOut();
              },
              label: Text('LogOut'),
            )
          ],
          title: Text('Co|Lab'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(
                  Icons.category,
                ),
                text: 'Projects',
              ),
              Tab(
                icon: Icon(
                  Icons.star,
                ),
                text: 'Favorites',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ProjectList(),
            FavList(),
          ],
        ),
      ),
    );
  }
}
