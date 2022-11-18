import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ssm/src/models/user.dart';

class FireStoreMethods {
  static FirebaseFirestore fs = FirebaseFirestore.instance;

  static Future<SUser> getUserByEmailWithSignup(
      String email, String name, String userId) async {
    CollectionReference users = fs.collection('users');
    SUser newUser;
    DocumentSnapshot doc = await users.doc(email).get();
    if (doc.exists) {
      newUser = SUser.fromJson(doc.data() as Map<String, dynamic>);
    } else {
      newUser = await addUser(email, name, userId);
    }
    return newUser;
  }

  static Future<SUser> addUser(String email, String name, String userId) async {
    CollectionReference users = fs.collection('users');
    SUser newUser =
        SUser(email: email, name: name, userId: userId, profileImg: "");
    users.doc(email).set(newUser.toJson());
    return newUser;
  }
}
