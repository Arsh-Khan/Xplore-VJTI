import 'package:firebase_auth/firebase_auth.dart';
import 'package:xplorevjtiofficialapp/database/userDatabase/MongoDBUserModel.dart';
import 'package:xplorevjtiofficialapp/database/userDatabase/mongodb.dart';

Future<dynamic> userDetails() async {
  final email = FirebaseAuth.instance.currentUser?.email;
  if (email != null) {
    final data = await MongoDatabase.getUserQueryData(email);
    final user = MongoDbUserModel.fromJson(data.last);
    return {
      'id': user.id,
      'regId': user.regId,
      'name': user.name,
      'branch': user.branch,
      'dob': user.dob,
      'email': user.email,
      'password': user.password,
    };
  } else {
    return {
      'id': 'null',
      'regId': 'null',
      'name': 'null',
      'dob': 'null',
      'email': 'null',
      'password': 'null',
    };
  }
  /*
  0 - User ID
  1 - User Registration ID
  2 - User Name 
  3 - User DOB
  4 - User Email
  5 - User Password
  */
}
