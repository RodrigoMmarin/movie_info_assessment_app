import 'package:flutter/material.dart';
import 'package:movie_info_assessment_app/pages/home_page.dart';
import 'package:movie_info_assessment_app/pages/info_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'OMDb info app',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const SearchPage(),
          '/info': (context) => const InfoPage(),
        });
  }
}
