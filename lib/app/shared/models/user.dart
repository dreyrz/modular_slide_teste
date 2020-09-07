import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  User({this.email, this.password, this.name, this.id});

  String id;
  String name;
  String email;
  String password;
  String confirmPassword;

  DocumentReference get firestoreRef =>
      Firestore.instance.document('users/$id');

  Future<void> saveData() async {
    try {
      await firestoreRef.setData(toMap());
    } catch (e) {
      print(e);
    }
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email};
  }
}
