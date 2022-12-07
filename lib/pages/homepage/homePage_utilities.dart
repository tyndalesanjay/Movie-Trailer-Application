import 'package:flutter/material.dart';
import 'package:movie_app/pages/movie_details/details_page.dart';
import '../../interfaces/movie_interface.dart';

Widget movieGrid({required List<Movies> items}) {
  return GridView.builder(
      // scrollDirection: Axis.horizontal,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisSpacing: 6,
        crossAxisSpacing: 5,
        childAspectRatio: 0.55,
        maxCrossAxisExtent: 200,
      ),
      itemCount: items.length,
      scrollDirection: Axis.vertical,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemBuilder: (BuildContext context, index) {
        return MovieGrid(context, items, index);
      });
}

Widget MovieGrid(BuildContext context, List<Movies> items, index) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return MovieDetails(
              title: 'Movie Details',
              movies: items[index],
            );
          },
        ),
      );
    },
    child: MovieCard(items[index]),
  );
}

Widget MovieCard(Movies movies) {
  return Card(
      elevation: 2.5,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Stack(
        children: [
          Image.network(
            movies.videoImage,
            fit: BoxFit.fill,
            height: double.maxFinite,
          ),
          Container(
            padding: EdgeInsets.only(right: 5),
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                print("Added to favorite");
              },
              icon: Icon(
                Icons.favorite_outline_outlined,
                color: Colors.white,
                size: 45,
              ),
            ),
          )
        ],
      ));
}
