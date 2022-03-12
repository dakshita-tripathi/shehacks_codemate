import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:codemate/models/profile.dart';
import 'package:codemate/screens/home/profileTile.dart';
import 'package:codemate/models/user.dart';
class ProfileList extends StatefulWidget {

  //int c=0;
  //ProfileList({required this.c});

  @override
  _ProfileListState createState() => _ProfileListState();
}

class _ProfileListState extends State<ProfileList> {
  @override
  int c = 0;
  List<String> profileName= [];
  List<String> profilecc=[];
  Widget build(BuildContext context) {
    final user = Provider.of<Usser?>(context);
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('profile').snapshots();
    _usersStream.forEach((profile){
      profile.docs.asMap().forEach((index,data){
        profileName.add(profile.docs[index]['name']);
        print(profileName[index]);
      });
    });
    _usersStream.forEach((profile){
      profile.docs.asMap().forEach((index,data){
        profilecc.add(profile.docs[index]['cc_rank']);
        print(profilecc[index]);
      });
    });

    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream:
            FirebaseFirestore.instance.collection('profile').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              print("entered stream builder");
              final documentSnapshotList = snapshot.data!.docs;
              c = documentSnapshotList!.length;
              if (!snapshot.hasData) {
                return Text('snapshot does not have data');
              }
              else {
                final profile = List<Profile>.generate(c, (i) => Profile(name: profileName[i], cc_rank: profilecc[i], he_rank: 0, apk_points: 0),);
                return ListView.builder(
                  itemCount: profile.length,
                  itemBuilder: (context, index) {
                    return profileTile(profile: profile[index],ind:index);},
                );

              }}
        ));
  }
}
