import 'package:hive/hive.dart';

import 'models/movie_models.dart';

class HiveUtils {
  static Box? _ourDataBase;

  initDb() async {
    ///We can pass own path storage to Hive
    _ourDataBase = Hive.box('movieDB');
    //_movieListDB = Hive.box('movieModelListDB');
  }

  static setString(String key, String value) {
    _ourDataBase?.put(key, value);
  }

  static setMovieId(String key, int value) {
    _ourDataBase?.put(key, value);
  }

  static int? getMovieId(String key) {
    return _ourDataBase?.get(key);
  }

  static String getString(String key) {
    return _ourDataBase?.get(key);
  }

  static void saveMovies(String key, List<MovieCardModel> value) {
    _ourDataBase?.put(key, value);
  }

  static List? getSavedMovies(String key) {
    return _ourDataBase?.get(key);
  }
}