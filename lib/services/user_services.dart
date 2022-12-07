// import '../utilities/shared_prefs.dart';
import 'package:movie_app/interfaces/movie_interface.dart';
import 'package:movie_app/utilities/shared_prefs.dart';

import '../interfaces/user_interface.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class UserService {
  String API_URL = 'https://movie-app-api.vercel.app/api/v1/auth';

  Future<Users> RegisterUsers(Users users) async {
    Map data = {
      'firstName': users.firstName,
      'lastName': users.lastName,
      'email': users.email,
      'password': users.password,
    };
    final response = await http.post(
      Uri.parse('$API_URL/register'),
      headers: <String, String>{
        'Content-type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(data),
    );
    print(data);
    if (response.statusCode == 201) {
      return Users.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to Register User');
    }
  }

  Future<bool> UserLogin(Users users) async {
    Map data = {
      'email': users.email,
      'password': users.password,
    };
    final response = await http.post(
      Uri.parse('$API_URL/login'),
      headers: <String, String>{
        'Content-type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      final resp = jsonDecode(response.body);
      if (resp['status'] == 'error') {
        print(response);
        return false;
      } 
      String token = resp['data']['accessToken'] ?? "";
      List<dynamic> userInfo = resp['data']['user']['favorites'];

      if (token == "") return false;

      Local.upDateSharedPreferences(token, userInfo);
      print(Local.readUser(token));
      // return Users.fromJson(jsonDecode(response.body));
      return true;
    } else {
      print('Failed to Register User');
      throw Exception('Failed to Login User');
    }
  }

  // Future<bool> UserLogin(Users users) async {
  //   Map data = {
  //     'email': users.email,
  //     'password': users.password,
  //   };
  //   final response = await http.post(
  //     Uri.parse('$API_URL/login'),
  //     headers: <String, String>{
  //       'Content-type': 'application/json; charset=UTF-8'
  //     },
  //     body: jsonEncode(data),
  //   );

  //   if (response.statusCode == 200) {
  //     final resp = jsonDecode(response.body);
  //     if (resp['status'] == 'error') {
  //       print(response);
  //       return false;
  //     } 
  //     String token = resp['data']['accessToken'] ?? "";
  //     Users userInfo = resp['data']['user']['favorites'];

  //     if (token == "") return false;

  //     Local.upDateSharedPreferences(token, userInfo);
  //     print(Local.readUser(token));
  //     return true;
  //   } else {
  //     print('Credential Error');
  //     return false;
  //   }
  // }
}
