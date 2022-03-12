class Usser {
  final String uid;
  Usser({required this.uid });
}
class UserData {
  final String uid;
  final String name;
  final String cc_rank;
  final int he_rank;
  final int apk_points;
  UserData(
      {required this.uid,
        required this.name,
        required this.cc_rank,
        required this.he_rank,
        required this.apk_points});
}
