import 'package:flutter/material.dart';
import 'package:codemate/models/profile.dart';
class profileTile extends StatelessWidget {
  //const profileTile({Key? key}) : super(key: key);
  final Profile profile; int ind;
  profileTile({required this.profile, required this.ind});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Card(
            margin: EdgeInsets.only(top: 20.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage('images/user.png'),
              ),
              title: Text(profile.name),
              subtitle: Text(
                  'has ${profile.cc_rank} stars on CodeChef \n has ${profile.he_rank} rank on HackerEarth \n has ${profile.apk_points} points in APK Month \n and is interested in ${profile.interests}'),
            )));
  }}