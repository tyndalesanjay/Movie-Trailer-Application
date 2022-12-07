import '../interfaces/movie_interface.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class MovieService {
  final String API_URL = "https://movie-app-api.vercel.app/api/v1/video";

  List<Movies> formatMovie(String responseBody) {
    final parsed = json.decode(responseBody);
    return parsed['data']
        .map<Movies>((json) => Movies.fromJson(json))
        .toList();
  }

  Future<List<Movies>> fetchMovies() async {
    final response = await http.get(Uri.parse(API_URL));
    if(response.statusCode == 200) {
      print(response.body);
      return formatMovie(response.body);
    } else {
      throw Exception('Error while getting movies');
    }
  }

  // * Create New Movie
  Future<Movies> createMovies(Movies movies) async {
    Map data = {
      'videoName': movies.videoName,
      'videoImage': movies.videoImage,
      'videoLink': movies.videoLink,
      'description': movies.description,
      'releaseDate': movies.releaseDate,
      'category': movies.category,
    };
    final response = await http.post(Uri.parse(API_URL),
    headers: <String, String>{
      'Content-type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(data),
    );
    print(data);
    if (response.statusCode == 202) {
      return Movies.fromJson(jsonDecode(response.body));
    } else {
      print(response.body);
      throw Exception('Failed to create Movie');
    }
  }

}
