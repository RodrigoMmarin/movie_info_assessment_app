import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_info_assessment_app/pages/info_page.dart';
import 'package:movie_info_assessment_app/widgets/body.dart';

import 'package:movie_info_assessment_app/widgets/movie.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late Dio client;
  Future<Movie>? movie;

  List<Movie> elements = [];

  @override
  void initState() {
    super.initState();
    client = Dio();
  }

  Future<Movie> fetchMovie(
    String title,
  ) {
    var r = client
        .get('http://www.omdbapi.com/?i=tt3896198&apikey=77cf7ae5&t=$title');

    return r.then((response) {
      setState(() {
        elements.add(Movie.fromJson(response.data));
      });
      return Movie.fromJson(response.data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MOVIE DETAILS APP'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: 'Enter Movie Name',
            ),
            onSubmitted: (value) {
              setState(() {
                movie = fetchMovie(
                  value,
                );
              });
            },
          ),
          Expanded(
            child: Stack(
              children: [
                ListView.builder(
                    itemCount: elements.length,
                    itemBuilder: ((context, index) {
                      return InkWell(
                        onTap: () => Navigator.pushNamed(context, '/info',
                            arguments: elements[index]),
                        child: ListTile(
                          title: Text(elements[index].title),
                        ),
                      );
                    })),
                if (movie != null)
                  FutureBuilder<Movie>(
                    future: movie,
                    builder: (context, snapshot) {
                      if (snapshot.hasData &&
                          snapshot.connectionState == ConnectionState.done) {
                        WidgetsBinding.instance.addPostFrameCallback((_) =>
                            Navigator.pushNamed(context, '/info',
                                    arguments: snapshot.data!)
                                .then((value) => movie = null));
                      } else if (snapshot.hasError) {
                        return const Text('Movie not Found');
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }
                      return SizedBox.shrink();
                    },
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
