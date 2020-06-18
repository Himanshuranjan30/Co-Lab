
import '../models/user.dart';
import './Authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:projq/screens/tabs_screen.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);
    
    // return either the Home or Authenticate widget
    if (user == null){
      return Authenticate();
    } else {
      return TabsScreen();
    }
    
  }
}