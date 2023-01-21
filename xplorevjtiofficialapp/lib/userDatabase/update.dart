import 'package:xplorevjtiofficialapp/userDatabase/MongoDBUserModel.dart';
import 'package:xplorevjtiofficialapp/userDatabase/dbhelper/mongodb.dart';

Future<String> updateUserData(String email, String password) async {
  final data = await MongoDatabase.getUserQueryData(email);
  final response = await MongoDatabase.update(
      MongoDbUserModel.fromJson(data.last), password.hashCode.toString());
  return response;
}
