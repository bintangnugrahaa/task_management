import 'dart:convert';

import 'package:d_method/d_method.dart';
import 'package:frontend/common/urls.dart';
import 'package:frontend/data/models/user.dart';
import 'package:http/http.dart' as http;

class UserSource {
  static const _baseURL = '${URLs.host}/users';

  static Future<User?> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseURL/login'),
        body: jsonEncode({"email": email, "password": password}),
      );

      DMethod.logResponse(response);

      if (response.statusCode == 200) {
        Map resBody = jsonDecode(response.body);
        return User.fromJson(Map.from(resBody));
      }

      return null;
    } catch (e) {
      DMethod.log(e.toString(), colorCode: 1);
      return null;
    }
  }

  static Future<bool> addEmployee(String name, String email) async {
    try {
      final response = await http.post(
        Uri.parse(_baseURL),
        body: jsonEncode({"name": name, "email": email}),
      );

      DMethod.logResponse(response);

      return response.statusCode == 201;
    } catch (e) {
      DMethod.log(e.toString(), colorCode: 1);
      return false;
    }
  }
}
