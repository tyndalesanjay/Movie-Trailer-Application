import 'package:flutter/material.dart';
import 'package:movie_app/interfaces/movie_interface.dart';
import 'package:movie_app/pages/movie_details/details_page.dart';
import 'package:movie_app/services/movie_services.dart';

// import '../homepage/homePage.dart';
import '../register/register_utilities.dart';

class AddMovies extends StatefulWidget {
  const AddMovies({super.key, required this.title});
  final String title;
  @override
  State<AddMovies> createState() => _AddMoviesState();
}

class _AddMoviesState extends State<AddMovies> {
  final _createKey = GlobalKey<FormState>();
  MovieService api = MovieService();
  TextEditingController _videoName = TextEditingController();
  TextEditingController _videoImage = TextEditingController();
  TextEditingController _videoLink = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _releaseDate = TextEditingController();
  TextEditingController _category = TextEditingController();

  void dispose() {
    _videoName.dispose();
    _videoImage.dispose();
    _videoLink.dispose();
    _releaseDate.dispose();
    _category.dispose();
    _description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: ListView(
          children: [
            Center(
              child: SizedBox(
                height: 40,
                child: Text(
                  'Add a New Movie',
                  style: TextStyle(color: Colors.red, fontSize: 34),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 0),
                    )
                  ]),
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(15),
              height: screenSize.height / 1.07,
              child: Form(
                key: _createKey,
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CFormField(
                        controller: _videoName,
                        label: 'Movie Title',
                        message: 'Please enter Movie Title'),
                    CFormField(
                        controller: _videoImage,
                        label: 'Image Link',
                        message: 'Please enter Movie Image'),
                    CFormField(
                        controller: _videoLink,
                        label: 'Trailer Link',
                        message: 'Enter Link to video'),
                    CFormField(
                        controller: _releaseDate,
                        label: 'Released Date',
                        message: 'Enter Release Date'),
                    CFormField(
                        controller: _category,
                        label: 'Category',
                        message: 'Enter Category'),
                    TextAreaFormField(
                        controller: _description,
                        label: 'Description',
                        message: 'Enter Movie Description'),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          TextButton(
                              style: TextButton.styleFrom(
                                  side: BorderSide(color: Colors.redAccent),
                                  padding: EdgeInsets.all(10)),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Cancel",
                                style: TextStyle(color: Colors.white),
                              )),
                          SizedBox(
                            width: 30,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              onPressed: () {
                                if (_createKey.currentState!.validate()) {
                                  api.createMovies(
                                    Movies.withoutID(
                                      videoName: _videoName.text,
                                      videoImage: _videoImage.text,
                                      videoLink: _videoLink.text,
                                      description: _description.text,
                                      releaseDate: _releaseDate.text,
                                      category: _category.text,
                                    ),
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MovieDetails(
                                        title: 'Details Page',
                                        movies: Movies.withoutID(
                                          videoName: _videoName.text,
                                          videoImage: _videoImage.text,
                                          videoLink: _videoLink.text,
                                          description: _description.text,
                                          releaseDate: _releaseDate.text,
                                          category: _category.text,
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  print("error");
                                }
                              },
                              child: Text('Add Movie')),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
