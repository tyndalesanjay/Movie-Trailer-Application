import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:movie_app/pages/homepage/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

