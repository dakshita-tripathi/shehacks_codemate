import 'package:flutter/material.dart';
import 'package:codemate/screens/home/profilelist.dart';
import 'package:codemate/services/auth.dart';
import 'package:codemate/shared/loading.dart';
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  final AuthService _auth = AuthService();
  bool loading=false;
  @override
  Widget build(BuildContext context) {
    return loading? Loading():Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
          title: Text('your codemates'),
          backgroundColor: Colors.white,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),]),
      body: ProfileList(),
    );
  }
}
