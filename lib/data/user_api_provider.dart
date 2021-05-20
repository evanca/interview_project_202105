import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:interview_project_202105/data/user_database.dart';
import 'package:interview_project_202105/models/user.dart';

class UserApiProvider {
  List<User> users;

  Future<List<Map>> parseUsers(String responseBody) async {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    users = parsed.map<User>((json) => User.fromJson(json)).toList();

    // Save data locally:
    DatabaseHelper helper = DatabaseHelper.instance;

    for (var user in users) {
      await helper.insertUser(user);
    }

    // Return local data:
    return helper.users();
  }

  Future<List<Map>> fetchUsers() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      return parseUsers(response.body);
    } else {
      // Reuse previously retrieved data:
      DatabaseHelper helper = DatabaseHelper.instance;
      return helper.users();
    }
  }
}
