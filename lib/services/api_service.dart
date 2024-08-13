import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user.dart';

class ApiService {
  static Future<List<User>> fetchUsers(int page) async {
    final response = await http
        .get(Uri.parse('https://reqres.in/api/users?page=$page&per_page=10'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<User> users =
          (data['data'] as List).map((json) => User.fromJson(json)).toList();
      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }
}
