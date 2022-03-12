import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:codemate/screens/home/home.dart';
import 'package:codemate/screens/home/update.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/hs_background.png'),
                  fit: BoxFit.cover),
            ),
            child: ListView(children: <Widget>[
              Container(
                child: Padding(
                    padding: EdgeInsets.only(top: 15.0, right: 20),
                    child: Text(
                      'Meet like minded \n people for your projects\n and contests',
                      style: TextStyle(color: Colors.white, fontSize: 18.0,fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right,
                    )),
              ),

              SizedBox(height: 30.0),
              Padding(
                  padding: EdgeInsets.only(left: 15, top: 10),
                  child: Text(
                    'UPCOMING CONTESTS',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  )), //Upcoming contests
              Row(
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(25, 0, 0, 0)),
                  Container(
                    width: MediaQuery.of(context).size.width / 3.0,
                    height: MediaQuery.of(context).size.height / 6,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/codechef.png'),
                            fit: BoxFit.fitWidth)),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width / 5, 0.0, 0.0, 0.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3.0,
                        height: MediaQuery.of(context).size.height / 6,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/hackerearth.png'),
                                fit: BoxFit.fitWidth)),
                      ))
                ],
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(25, 0, 0, 0)),
                  Container(
                    width: MediaQuery.of(context).size.width / 3.0,
                    //height: MediaQuery.of(context).size.height / 4,
                    child: new InkWell(
                        child: new Text('Check out now'),
                        onTap: () => launch(
                            'https://www.codechef.com/contests?itm_medium=navmenu&itm_campaign=allcontests')),
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width / 6.5,
                      10.0,
                      0.0,
                      0.0)),
                  Container(
                    width: MediaQuery.of(context).size.width / 3.0,
                    //height: MediaQuery.of(context).size.height / 4,
                    child: new InkWell(
                        child: new Text('Check out now'),
                        onTap: () =>
                            launch('https://www.hackerearth.com/challenges/')),
                  ),
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(left: 15, top: 35),
                  child: Text(
                    'EXPLORE CODIES',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  )),
              SizedBox(height: 8.0,),
              Row(
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(25, 0, 0, 0)),
                  Container(

                      color: Color.fromRGBO(0, 135, 140, 11.8),
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width / 4,
                      child: Column(children: [
                        SizedBox(height: 32.0),
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage('images/user.png'),
                        ),
                        SizedBox(height: 8.0),
                        Text('Dakshita'),
                      ])),
                  Padding(padding: EdgeInsets.fromLTRB(25, 0, 0, 0)),
                  Container(

                      color: Color.fromRGBO(0, 135, 140, 11.8),
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width / 4,
                      child: Column(children: [
                        SizedBox(height: 32.0),
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage('images/user.png'),
                        ),
                        SizedBox(height: 8.0),
                        Text('Prakriti'),
                      ])),
                  Padding(padding: EdgeInsets.fromLTRB(25, 0, 0, 0)),
                  Container(

                      color: Color.fromRGBO(0, 135, 140, 11.8),
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width / 4,
                      child: Column(children: [
                        SizedBox(height: 32.0),
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage('images/user.png'),
                        ),
                        SizedBox(height: 8.0),
                        Text('Manashvi'),
                      ]))
                ],
              ),
              SizedBox(height: 10.0),
              Padding(padding: EdgeInsets.fromLTRB(15, 10, 15, 10)),
              RaisedButton(
                color: Color.fromRGBO(0, 29, 30, 11.8),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => update()));
                },
                child: Text('Update your profile',style: TextStyle(color: Colors.white),),
              ),

              SizedBox(height: 10.0),
              Padding(padding: EdgeInsets.fromLTRB(15, 10, 15, 10)),
              RaisedButton(
                color: Color.fromRGBO(0, 29, 30, 11.8),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => home()));
                },
                child: Text('View all profiles',style: TextStyle(color: Colors.white),),
              ),
            ])));
  }
}
