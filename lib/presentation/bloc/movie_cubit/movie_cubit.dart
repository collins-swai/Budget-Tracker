import 'package:budget_tracker/data/network/movie_data_source.dart';
import 'package:budget_tracker/data/repository/movie_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieInitial());

  final MovieRepository _movieRepository = MovieRepository(MovieDataSource());

  void getUpcomingMovies({required String apiUrl}) async {
    final moviesData = await _movieRepository.getUpcomingMovies(url: apiUrl);

    Future.delayed(const Duration(milliseconds: 500), () {
      emit(MovieFetched(moviesData));
    });
  }
}