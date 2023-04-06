class MovieConstants {
  MovieConstants._internal();

  static String baseUrl = 'https://api.themoviedb.org/3/movie';
  static String key = '47524f0ec82074c661f96e29d20fa7e4';
  static String upcomingMovies =
      "http://api.themoviedb.org/3/movie/upcoming?api_key=47524f0ec82074c661f96e29d20fa7e4";
  static String popularMovies =
      "https://api.themoviedb.org/3/movie/popular?api_key=$key&language=en-US&page=1";

  static String topRated =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=$key&language=en-US&page=1";

  static String searchMovieUrl =
      "https://api.themoviedb.org/3/search/movie?api_key=$key&language=en-US&page=1&include_adult=false&";
}