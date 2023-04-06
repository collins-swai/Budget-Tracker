import 'package:dio/dio.dart';

import '../../core/models/movie_details_model.dart';
import '../../core/models/movie_models.dart';
import '../../core/models/movies_search.dart';
import '../../core/movie_constant.dart';
import '../../main.dart';

class MovieDataSource implements MovieDataSourceAbs {
  /// initializing dio client
  /// when the object of MovieDataSource is created
  MovieDataSource() {
    _dioClient = getIt<Dio>();
  }

  late Dio _dioClient;

  /// Fetch api using dio client' get method
  @override
  Future<List<MovieCardModel>> fetchUpcomingMovies(
      {required String upcomingMovies}) async {
    /// initializing empty map of json
    Map<String, dynamic> json = {};

    /// initializing empty list of MovieCardModel
    List<MovieCardModel> movieCardModels = [];

    /// getting the api response whose type is Response<Map<String, dynamic>>
    final Response<Map<String, dynamic>> jsonResponse =
        await _dioClient.get(upcomingMovies);

    /// checking if api json is not null
    if (jsonResponse.data != null) {
      json = jsonResponse.data!;
    }

    /// Looping through a list of results-key in a api json
    for (var result in json['results']) {
      final MovieCardModel movieCard = MovieCardModel.fromJson(result);
      movieCardModels.add(movieCard);
    }
    return movieCardModels;
  }

  Future<MovieDetailsModel?> fetchMovieDetails({required int movieId}) async {
    MovieDetailsModel? movieDetailsModel;
    final Response<
        Map<String,
            dynamic>> movieDetailResponse = await _dioClient.get(
        '${MovieConstants.baseUrl}/$movieId?api_key=${MovieConstants.key}&language=en-US');

    final Map<String, dynamic>? movieJson = movieDetailResponse.data;

    if (movieJson != null) {
      movieDetailsModel = MovieDetailsModel.fromJson(movieJson);
    }
    return movieDetailsModel;
  }

  // @override
  Future<SearchedMovieModel?> searchMovie({required String userQuery}) async {
    SearchedMovieModel? searchedMovieModel;
    final Response<Map<String, dynamic>> response = await _dioClient
        .get('${MovieConstants.searchMovieUrl}query=$userQuery');

    final Map<String, dynamic>? movieJson = response.data;
    if (movieJson != null) {
      searchedMovieModel = SearchedMovieModel.fromJson(movieJson);
    }

    return searchedMovieModel;
  }
}

abstract class MovieDataSourceAbs {
  Future<List<MovieCardModel>> fetchUpcomingMovies(
      {required String upcomingMovies});
}
