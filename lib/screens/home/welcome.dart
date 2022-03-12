import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:codemate/screens/authentication/signin.dart';
import 'package:codemate/screens/authentication/register.dart';
class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  Widget buildLogInBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>signIn()),),
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.white,
        child: Text(
          'SIGNIN',
          style: TextStyle(
              color: Color(0xff33cccc),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildRegisterBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()),),
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Color(0xff33cccc),
        child: Text(
          'REGISTER',
          style: TextStyle(
              color: Color(0xfff2f2f2),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background.png"),
                    fit: BoxFit.cover
                ),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color(0x6633cccc),
                      Color(0x9933cccc),
                      Color(0xcc33cccc),
                      Color(0xff33cccc),
                    ]),
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
                      'WELCOME CODIES',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 300),
                    buildLogInBtn(),
                    SizedBox(height: 5),
                    buildRegisterBtn(),
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