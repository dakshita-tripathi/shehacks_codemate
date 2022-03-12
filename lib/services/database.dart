import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codemate/models/profile.dart';
import 'package:codemate/models/user.dart';
class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
  final CollectionReference profileCollection =
  FirebaseFirestore.instance.collection('profile');
  Future<void> updateUserData(String name, String cc_rank, int he_rank, int apk_points) async {
    return await profileCollection.doc(uid).set({
      'name': name,
      'cc_rank': cc_rank,
      'he_rank': he_rank,
      'apk_points': apk_points
    });
  }
}