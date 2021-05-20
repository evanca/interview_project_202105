import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:interview_project_202105/models/user.dart';

class UserApiProvider {
  List<Map> parseUsers(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    List<User> users = parsed.map<User>((json) => User.fromJson(json)).toList();
    return List.generate(users.length, (index) => users[index].toMap);
  }

  Future<List<Map>> fetchUsers() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      return parseUsers(response.body);
    } else {
      throw Exception('Failed to load user');
    }
  }
}
