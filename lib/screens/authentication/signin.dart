import 'package:flutter/material.dart';
import 'package:codemate/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:codemate/screens/authentication/register.dart';
import 'package:codemate/screens/home/home.dart';
import 'package:codemate/shared/loading.dart';
import 'package:codemate/homeScreen.dart';
class signIn extends StatefulWidget {
  //const signIn({Key? key}) : super(key: key);

  //final Function toggleView;
  //signIn({required this.toggleView});
  @override
  _signInState createState() => _signInState();
}

class _signInState extends State<signIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  bool loading = false;
  String password = '';
  String error = '';
  @override
  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(
              0.5,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          height: 60,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.email, color: Colors.transparent),
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.black38)),
            validator: (val) => val!.isEmpty ? 'Enter an email' : null,
            onChanged: (val) {
              setState(() => email = val);
            },
          ),
        )
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color.fromARGB(83, 117, 117, 117).withOpacity(0.5),
            borderRadius: BorderRadius.circular(16),
          ),
          height: 60,
          child: TextFormField(
            obscureText: true,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.lock, color: Colors.transparent),
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.black38)),
            validator: (val) => val!.length < 6
                ? 'Enter a password of 6 or more characters'
                : null,
            onChanged: (val) {
              setState(() => password = val);
            },
          ),
        )
      ],
    );
  }

  Widget buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () async {
            dynamic result = await _auth.signInWithEmailAndPassword(email, password);
            if (result == null) {
              setState(() {
                error = 'could not sign in';loading=false;
              }
              );
            }
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()),);
        },
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.white,
        child: Text(
          'LOGIN',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildSignUpBtn() {
    return GestureDetector(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => Register())),
        child: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: 'Don\'t have an Account?',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w500)),
              TextSpan(
                  text: 'Sign Up',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold))
            ])));
  }

  @override
  Widget build(BuildContext context) {
    return loading? Loading():Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/background.png"),
                    fit: BoxFit.cover,
                  ),
                  ),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 120,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Sign In',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 50),
                    buildEmail(),
                    SizedBox(height: 20),
                    buildPassword(),
                    buildLoginBtn(),
                    buildSignUpBtn(),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
