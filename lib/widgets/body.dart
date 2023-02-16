import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movie_info_assessment_app/pages/home_page.dart';
import 'package:movie_info_assessment_app/widgets/movie.dart';

class Body extends StatelessWidget {
  const Body({super.key, required Movie movie});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    return Scaffold(
        appBar: AppBar(
          title: Text(movie.title),
          leading: GestureDetector(
            child: const Icon(Icons.arrow_back_ios),
            onTap: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: size.height * 0.02),
              Container(
                  height: size.height * 0.48,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(movie.poster)),
                  )),
              SizedBox(
                height: size.height * 0.07,
                child: ListTile(
                  title: const Text('Metascore'),
                  subtitle: Text(movie.metascore),
                ),
              ),
              SizedBox(
                height: size.height * 0.1,
                child: ListTile(
                    title: const Text('Released'),
                    subtitle: Text(movie.released)),
              ),
              SizedBox(
                height: size.height * 0.2,
                child: ListTile(
                  title: const Text('Plot'),
                  subtitle: Text(movie.plot),
                ),
              )
            ],
          ),
        ));
  }
}
