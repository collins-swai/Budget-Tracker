import 'package:budget_tracker/main.dart';
import 'package:budget_tracker/presentation/bloc/movie_search_cubit/movie_search_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/models/movies_search.dart';
import '../core/utils/size_utils.dart';

class MovieSearchScreen extends StatefulWidget {
  const MovieSearchScreen({Key? key}) : super(key: key);

  @override
  State<MovieSearchScreen> createState() => _MovieSearchScreenState();
}

class _MovieSearchScreenState extends State<MovieSearchScreen> {
  late TextEditingController _textEditingController;
  late MovieSearchCubit _movieSearchCubit;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _movieSearchCubit = getIt<MovieSearchCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: TextFormField(
          controller: _textEditingController,
          autocorrect: false,
          decoration: const InputDecoration(hintText: 'Search Movie'),
          onFieldSubmitted: (userInput) {
            _movieSearchCubit.searchMovie(queryFromUi: userInput);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Search Movies",
                        style: TextStyle(fontSize: 25, color: Colors.white)),
                  )
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Search Movies",
                      style: TextStyle(fontSize: 25, color: Colors.black),
                      textAlign: TextAlign.start,
                    ),
                    BlocBuilder<MovieSearchCubit, MovieSearchState>(
                        bloc: _movieSearchCubit,
                        builder: (context, state) {
                          if (state is MovieFetching) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is SearchedMovieFetched) {
                            final SearchedMovieModel searchedMovie =
                                state.searchedMovieModel;

                            return Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListView.builder(
                                    itemCount: searchedMovie.results.length,
                                    itemBuilder: (context, index) {
                                      final singleMovie =
                                          searchedMovie.results[index];

                                      return Column(
                                        children: [
                                          Card(
                                            margin: const EdgeInsets.all(20),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                ListTile(
                                                  leading: CachedNetworkImage(
                                                    imageUrl:
                                                    "https://image.tmdb.org/t/p/w300${singleMovie.posterPath}",
                                                  ),
                                                  title: Text('${singleMovie.title}'),
                                                  subtitle: Text('${singleMovie.overview}'),
                                                ),
                                              ],
                                            ),
                                          ),
                                          // Text(
                                          //   ,
                                          // ),
                                          // Text(singleMovie.originalLanguage,
                                          //     style:
                                          //         TextStyle(color: Colors.black)),
                                          // Text(
                                          //   ,
                                          // ),
                                        ],
                                      );
                                    }),
                              ),
                            );
                          } else if (state is SearchedError) {
                            return Center(
                              child: Text(state.errorMessage,
                                  style: TextStyle(color: Colors.black)),
                            );
                          }
                          return const Center(
                            child: Text('You have not searched any movies yet',
                                style: TextStyle(color: Colors.black)),
                          );
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
