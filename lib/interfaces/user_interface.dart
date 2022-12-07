// import 'package:movie_app/interfaces/movie_interface.dart';

import 'package:movie_app/interfaces/movie_interface.dart';

class Users {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  List<dynamic>? favorites;

  Users({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.favorites,
  });

  Users.withoutID({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  Users.withoutFirstName({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
      };

  factory Users.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson);

    var list = parsedJson['favorites'] as List;
    print(list.runtimeType); //returns List<dynamic>
    List<dynamic> favorites = list.map((i) => Movies.fromJson(i)).toList();
    return Users(
      id: parsedJson['_id'],
      firstName: parsedJson['firstName'],
      lastName: parsedJson['lastName'],
      email: parsedJson['email'],
      password: parsedJson['password'],
      favorites: favorites,
    );
  }
}
