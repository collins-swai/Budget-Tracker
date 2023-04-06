import '../../core/models/movie_details_model.dart';
import '../../core/models/movie_models.dart';
import '../../core/models/movies_search.dart';
import '../network/movie_data_source.dart';

class MovieRepository {
  MovieRepository(this._movieDataSource);

  late final MovieDataSource _movieDataSource;

  Future<List<MovieCardModel>> getUpcomingMovies({required String url}) async {
    return await _movieDataSource.fetchUpcomingMovies(upcomingMovies: url);
  }

  Future<MovieDetailsModel?> getMovieDetails({required int movieId}) async {
    return await _movieDataSource.fetchMovieDetails(movieId: movieId);
  }

  Future<SearchedMovieModel?> searchMovie(
      {required String queryFromCubit}) async {
    return await _movieDataSource.searchMovie(userQuery: queryFromCubit);
  }
}
