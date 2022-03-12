import 'package:flutter/material.dart';
import 'package:codemate/services/auth.dart';
import 'package:codemate/screens/home/update.dart';
import 'package:codemate/screens/authentication/signin.dart';
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  final AuthService _auth = AuthService();
  String email = '';
  String password = ''; String error='';
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: Text("Register"),
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Sign In'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>signIn()),);
                //widget.toggleView();
              },
            ),
          ],
          //to add a signin button
        ),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
                child: Column(children: <Widget>[
                  SizedBox(height: 20.0),
                  TextFormField(
                    validator: (val) =>
                    val!.isEmpty ? 'Enter an email' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    obscureText: true,
                    validator: (value) => value!.length < 6
                        ? 'Enter a password of 6 or more characters'
                        : null,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton(
                      color: Colors.yellow,
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed:() async {
                          dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                          if (result == null) {
                            setState(() {
                              error = 'please supply a valid email';
                            });
                          }
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>update()),);

                      }
                  ),
                  SizedBox(height: 12.0),
                  Text(error,style: TextStyle(color: Colors.red, fontSize: 14.0),),
                ])))
    );
  }
}
