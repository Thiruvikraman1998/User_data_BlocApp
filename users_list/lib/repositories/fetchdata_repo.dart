import 'dart:convert';

import 'package:http/http.dart';
import 'package:users_list/models/user_model.dart';

class UsersRepository {
  String allUsersUrl = "https://reqres.in/api/users?page=2";

  Future<List<ListUserModel>> fetchUsers() async {
    try {
      Response response = await get(Uri.parse(allUsersUrl));

      if (response.statusCode == 200) {
        final List result = jsonDecode(response.body)['data'];
        return result.map(((e) => ListUserModel.fromJson(e))).toList();
      } else {
        throw Exception("failed to load data");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
