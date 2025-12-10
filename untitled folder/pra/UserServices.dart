import 'package:dio/dio.dart';
import 'package:api_1/UserModel.dart';

class UserServices {
  Dio dio = Dio();
  final String URL = "https://jsonplaceholder.typicode.com/users";

  Future<List<UserModel>> fetchUser() async {
    try {
      final response = await dio.get("$URL");

      if (response.statusCode == 200) {
        List<UserModel> users = (response.data as List)
            .map((userJOSN) => UserModel.fromJson(userJOSN))
            .toList();
        return users;
      } else {
        throw Exception("Failed to load the USERS!");
      }
    } catch (e) {
      throw Exception("ERROR : ${e}");
    }
  }
}
