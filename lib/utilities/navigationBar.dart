import 'package:flutter/material.dart';
import 'package:movie_app/pages/add_movie/addMovie_page.dart';
import 'package:movie_app/pages/homepage/homePage.dart';
import 'package:movie_app/pages/register/register_page.dart';

class BNavigationBar extends StatelessWidget {
  const BNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.red, width: 5)),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: Colors.redAccent,
        selectedFontSize: 15,
        unselectedItemColor: Colors.white,
        unselectedFontSize: 15,
        iconSize: 36,
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomePage(title: 'Home Page');
                }));
              },
              icon: Icon(Icons.home_outlined),
              padding: const EdgeInsets.all(0),
            ),
          ),
          BottomNavigationBarItem(
            label: "New Movie",
            icon: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddMovies(
                        title: 'Add New Movie',
                      ),
                    ));
              },
              icon: Icon(Icons.add_box_outlined),
              padding: const EdgeInsets.all(0),
            ),
          ),
          BottomNavigationBarItem(
            label: "Favorites",
            icon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_outline_outlined),
              padding: const EdgeInsets.all(0),
            ),
          ),
          BottomNavigationBarItem(
            label: "Login",
            icon: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return RegisterUser(title: 'Register User');
                  }),
                );
              },
              icon: Icon(Icons.login_outlined),
              padding: const EdgeInsets.all(0),
            ),
          ),
        ],
      ),
    );
  }
}
