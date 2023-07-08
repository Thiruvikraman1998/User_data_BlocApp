import 'dart:convert';

import 'package:http/http.dart';
import 'package:users_list/models/user_model.dart';

class UsersRepository {
  String allUsersUrl = "https://reqres.in/api/users?page=";

  Future<List<ListUserModel>> fetchUsers(int page) async {
    try {
      Response response = await get(Uri.parse('$allUsersUrl$page'));

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
