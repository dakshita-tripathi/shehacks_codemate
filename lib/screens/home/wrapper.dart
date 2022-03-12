import 'package:flutter/material.dart';
import 'package:codemate/models/user.dart';
import 'package:codemate/screens/authentication/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:codemate/screens/home/home.dart';
class wrapper extends StatelessWidget {
  const wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Usser?>(context);
    if( user==null){
      return Authenticate(); //not signed in->welcome->login/sign in
    }
    else{
      return home();//call home screen
    }
  }
}
