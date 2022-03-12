import 'package:flutter/material.dart';
import 'package:codemate/services/auth.dart';
import 'package:codemate/screens/home/home.dart';
import 'package:codemate/screens/authentication/register.dart';
class signIn extends StatefulWidget {
  //const signIn({Key? key}) : super(key: key);
  @override
  _signInState createState() => _signInState();
}

class _signInState extends State<signIn> {
  final AuthService _auth = AuthService();
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: Text("sign in"),
          actions: <Widget>[
            FlatButton.icon(
              //style: style,
              icon: Icon(Icons.person),
              onPressed: () {
                //widget.toggleView();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()),);
              },
              label: Text('Register'),
            )
          ],
        ),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
                child: Column(children: <Widget>[
                  SizedBox(height: 20.0),
                  TextFormField(
                    validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    obscureText: true,
                    validator: (val) => val!.length < 6
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
                        'Sign in',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () async {
                          dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                          if (result == null) {
                            setState(() {
                              error = 'could not sign in';
                            }
                            );
                          }
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>home()),);
                        }
    ),

                ]))));
  }
}