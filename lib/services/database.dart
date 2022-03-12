import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codemate/models/profile.dart';
import 'package:codemate/models/user.dart';
class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
  final CollectionReference profileCollection =
  FirebaseFirestore.instance.collection('profile');
  Future<void> updateUserData(String name, String cc_rank, int he_rank, int apk_points, String interests) async {
    return await profileCollection.doc(uid).set({
      'name': name,
      'cc_rank': cc_rank,
      'he_rank': he_rank,
      'apk_points': apk_points,
      'interests':interests,
    });
  }

  List<Profile> _profilelistFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Profile(
        name: doc['name'] ?? '',
        cc_rank: doc['cc_rank'] ,
        he_rank: doc['he_rank'] ?? 0,//
        apk_points: doc['apk_points'] ?? 0,//
        interests: doc['interests']??0,
      );
    }).toList();
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot['name'],
        cc_rank: snapshot['codechef rank'],
        he_rank: snapshot['hackerearth rank'],
        apk_points: snapshot['aproksha month points'],
        interests: snapshot['your interests']
    );

  }

  Stream<List<Profile>> get profile {
    return profileCollection.snapshots().map(_profilelistFromSnapshot);
  }}