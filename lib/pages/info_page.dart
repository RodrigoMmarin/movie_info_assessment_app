import 'package:flutter/material.dart';
import 'package:movie_info_assessment_app/widgets/body.dart';
import 'package:movie_info_assessment_app/widgets/movie.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)!.settings.arguments as Movie;
    return Scaffold(
      body: Body(movie: movie),
    );
  }
}
