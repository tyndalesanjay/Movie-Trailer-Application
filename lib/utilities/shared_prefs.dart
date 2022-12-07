import 'dart:convert';

import 'package:movie_app/interfaces/user_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Local {
  static upDateSharedPreferences(String token, dynamic value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(token, jsonEncode(value));
  }

  static readUser(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //json.decode to convert json string back to Json Object
    return jsonDecode(prefs.getString(token)!);
    // Map<String, dynamic> jsonData = jsonDecode(prefs.getString(token));
    // print('Preferred info = ${jsonData}');

    //  return Users.fromJson(jsonData);
  }

  // static storeData() {
  //   Users users = Users(id: id, firstName: firstName, lastName: lastName, email: email, password: password, favorites: favorites);
  // }
}
