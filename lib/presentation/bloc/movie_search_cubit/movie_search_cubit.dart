import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/models/movies_search.dart';
import '../../../data/repository/movie_repository.dart';
import '../../../main.dart';

part 'movie_search_cubit_state.dart';

class MovieSearchCubit extends Cubit<MovieSearchState> {
  MovieSearchCubit()
      : _movieRepository = getIt<MovieRepository>(),
        super(MovieSearchInitial());

  late final MovieRepository _movieRepository;

  void searchMovie({required String queryFromUi}) async {
    // Future.delayed()

    emit(MovieFetching());

    final SearchedMovieModel? movieModel =
        await _movieRepository.searchMovie(queryFromCubit: queryFromUi);

    _checkResultResponse(movieModel);
  }

  void _checkResultResponse(SearchedMovieModel? movieModel) {
    if (movieModel != null && movieModel.results.isNotEmpty) {
      emit(SearchedMovieFetched(searchedMovieModel: movieModel));
    } else {
      emit(const SearchedError(errorMessage: 'No Result Found'));
    }
  }
}
