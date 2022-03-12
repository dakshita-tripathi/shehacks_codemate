import 'package:flutter/material.dart';
import 'package:codemate/services/auth.dart';
import 'package:codemate/screens/home/home.dart';
import 'package:codemate/screens/authentication/register.dart';
import 'package:flutter/services.dart';
import 'package:codemate/screens/home/update.dart';
import 'package:codemate/shared/loading.dart';

class Register extends StatefulWidget {
  //const signIn({Key? key}) : super(key: key);
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
            color: Color.fromARGB(71, 158, 158, 158).withOpacity(
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
                prefixIcon: Icon(Icons.email, color: Color(0xff33cccc)),
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
            color: Color.fromARGB(71, 158, 158, 158).withOpacity(
              0.5,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          height: 60,
          child: TextFormField(
            obscureText: true,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.lock, color: Color(0xff33cccc)),
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.black38)),
            validator: (value) => value!.length < 6
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

  Widget buildRegisterBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            setState(() => loading = true);
            dynamic result =
            await _auth.signInWithEmailAndPassword(email, password);
            if (result == null) {
              setState(() {
                error = 'could not sign in';
                loading = false;
              });
            }
          }
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => update()),
          );
        },
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.white,
        child: Text(
          'REGISTER',
          style: TextStyle(
              color: Color(0xff33cccc),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  final AuthService _auth = AuthService();
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
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
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Color(0x6633cccc),
                        Color(0x9933cccc),
                        Color(0xcc33cccc),
                        Color(0xff33cccc),
                      ])),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 120,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: CircleAvatar(
                            radius: 50.0,
                            backgroundColor:
                            Color.fromARGB(71, 158, 158, 158)
                                .withOpacity(
                              0.5,
                            ),
                            child: const Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 40,
                            ))),
                    SizedBox(height: 50),
                    buildEmail(),
                    SizedBox(height: 20),
                    buildPassword(),
                    SizedBox(height: 50),
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
