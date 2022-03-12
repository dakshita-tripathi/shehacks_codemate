import 'package:flutter/material.dart';
import 'package:login/models/user.dart';
import 'package:login/screens/authentication/authenticate.dart';
import 'package:provider/provider.dart';
class wrapper extends StatelessWidget {
  const wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Usser?>(context);
    if( user==null){
      return Authenticate(); //not signed in->welcome->login/sign in
    }
    else{
      return Scaffold();//call home screen
    }
  }
}
