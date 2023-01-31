import 'package:xplorevjtiofficialapp/database/userDatabase/MongoDBUserModel.dart';
import 'package:xplorevjtiofficialapp/database/userDatabase/mongodb.dart';

Future<String> updateUserPassword(String email, String password) async {
  final data = await MongoDatabase.getUserQueryData(email);
  final response = await MongoDatabase.updatePassword(
      MongoDbUserModel.fromJson(data.last), password.hashCode.toString());
  return response;
}
