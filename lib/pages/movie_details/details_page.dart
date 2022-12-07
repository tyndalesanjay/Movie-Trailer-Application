import 'package:flutter/material.dart';
import 'package:movie_app/interfaces/movie_interface.dart';
import 'package:movie_app/pages/view_movie/moviePlayer_page.dart';
import 'package:movie_app/utilities/appBar.dart';
import 'package:blur/blur.dart';
import '../../services/movie_services.dart';
// import '../../utilities/magic_strings.dart';
import '../../utilities/navigationBar.dart';

class MovieDetails extends StatefulWidget {
  MovieDetails({super.key, required this.title, required this.movies});
  final String title;
  final Movies movies;

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  final MovieService api = MovieService();
  @override
  Widget build(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppSearchBar(preferredSize: Size.fromHeight(60)),
        bottomNavigationBar: BNavigationBar(),
        body: ListView(
          children: [
            SizedBox(),
            Stack(
              children: [
                Blur(
                  child: Container(
                    height: screenSize.height * .4,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.movies.videoImage),
                        fit: BoxFit.fill,
                        alignment: Alignment.topLeft,
                      ),
                    ),
                  ),
                  blur: 2,
                  blurColor: Colors.black,
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 40.0, left: 8, right: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: screenSize.width * 0.37,
                            height: 240,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7)),
                              image: DecorationImage(
                                image: NetworkImage(widget.movies.videoImage),
                                fit: BoxFit.fill,
                                // opacity: 0.8459,
                              ),
                            ),
                          ),
                          Container(
                            width: screenSize.width /2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // SizedBox(width: 40,),
                                Text(
                                  widget.movies.videoName,
                                  softWrap: true,
                                  style: TextStyle(
                                      fontSize: screenSize.width / 12,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                                // Text(
                                //   widget.movies.releaseDate,
                                //   softWrap: true,
                                //   style: TextStyle(
                                //       fontSize: screenSize.width / 12,
                                //       fontWeight: FontWeight.w700,
                                //       color: Colors.white),
                                // ),
                                Text(
                                  widget.movies.category,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 37),
                      decoration: BoxDecoration(color: Colors.black),
                      // height: 150,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: Directionality(
                              textDirection: TextDirection.ltr,
                              child: TextButton.icon(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return MoviePlayer(
                                      title: 'Movie Player',
                                      movies: widget.movies
                                    );
                                  }));
                                },
                                icon: Icon(
                                  Icons.play_arrow,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  'Play Trailer',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.redAccent,
                                  padding: EdgeInsets.only(
                                      top: 10,
                                      bottom: 10,
                                      left: 100,
                                      right: 100),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // width: double.infinity,
                            width: 380,
                            margin: EdgeInsets.only(top: 10, left: 16),
                            padding: EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                                border: Border.symmetric(
                                    horizontal: BorderSide(
                                        color: Colors.redAccent, width: 2))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.white,
                                    size: 38,
                                  ),
                                  padding: const EdgeInsets.all(0),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.file_download_off,
                                    color: Colors.white,
                                    size: 38,
                                  ),
                                  padding: const EdgeInsets.all(0),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.share_sharp,
                                    color: Colors.white,
                                    size: 38,
                                  ),
                                  padding: const EdgeInsets.all(0),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 26,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Overview",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  widget.movies.description,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
// class trailerPreview extends StatefulWidget {
//   const trailerPreview({super.key});

//   @override
//   State<trailerPreview> createState() => _trailerPreviewState();
// }

// class _trailerPreviewState extends State<trailerPreview> {
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.ltr,
//       child: TextButton.icon(
//         onPressed: () {
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) {
//             return MoviePlayer(title: 'Movie Player', movies: items[index]);
//           }));
//         },
//         icon: Icon(
//           Icons.play_arrow,
//           size: 30,
//           color: Colors.white,
//         ),
//         label: Text(
//           'Play Trailer',
//           style: TextStyle(
//               color: Colors.white, fontSize: 20),
//         ),
//         style: TextButton.styleFrom(
//           backgroundColor: Colors.redAccent,
//           padding: EdgeInsets.only(
//               top: 10,
//               bottom: 10,
//               left: 100,
//               right: 100),
//         ),
//       ),
//     );
//   }
// }

  

