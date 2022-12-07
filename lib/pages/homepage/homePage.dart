import 'package:flutter/material.dart';
import 'package:movie_app/interfaces/movie_interface.dart';
import 'package:movie_app/services/movie_services.dart';
import 'package:movie_app/utilities/appBar.dart';
// import 'package:movie_app/utilities/magic_strings.dart';
import '../../utilities/navigationBar.dart';
import 'homePage_utilities.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieService api = MovieService();
  late Future<List<Movies>> movieList;

  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppSearchBar(
        preferredSize: Size.fromHeight(60),
      ),
      bottomNavigationBar: BNavigationBar(),
      body: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: FutureBuilder<List<Movies>>(
            future: api.fetchMovies(),
            builder: ((context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? movieGrid(items: snapshot.data!)
                  : Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
            }),
          )),
    );
  }
}
