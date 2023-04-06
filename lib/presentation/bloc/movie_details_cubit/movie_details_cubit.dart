import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/network/movie_data_source.dart';
import '../../../data/repository/movie_repository.dart';
import 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit() : super(MovieDetailsInitial());

  final MovieRepository _movieRepository = MovieRepository(MovieDataSource());
  void getMovieDetails({required int movieId}) async {
    final movieDetails =
    await _movieRepository.getMovieDetails(movieId: movieId);

    if (movieDetails != null) {
      emit(MovieDetailsFetched(movieDetails));
    }
  }
}