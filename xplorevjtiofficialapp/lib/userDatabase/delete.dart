import 'package:xplorevjtiofficialapp/userDatabase/MongoDBUserModel.dart';
import 'package:xplorevjtiofficialapp/userDatabase/dbhelper/mongodb.dart';

Future<String> deleteUserData({required String email}) async {
  final data = await MongoDatabase.getUserQueryData(email);
  final noOfData = data.length;
  final response = [];
  for (int i = 0; i < noOfData; i++) {
    response[i] =
        await MongoDatabase.deleteUserData(MongoDbUserModel.fromJson(data[i]));
  }
  if (response.contains('User Deleted')) {
    return "User Deleted";
  } else {
    return "Something went Wrong";
  }
}
