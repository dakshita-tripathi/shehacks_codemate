import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:codemate/screens/authentication/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:codemate/models/user.dart';
import 'package:codemate/services/auth.dart';
import 'package:codemate/screens/home/wrapper.dart';
import '';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<Usser?>.value(
      initialData: Usser(uid: ""),
      value: AuthService().user,
      child: MaterialApp(home: wrapper()),
    );
    return MaterialApp(
      home: Authenticate(),
    );
  }
}
