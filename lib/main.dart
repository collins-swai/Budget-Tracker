import 'package:budget_tracker/presentation/bloc/movie_cubit/movie_cubit.dart';
import 'package:budget_tracker/presentation/bloc/movie_details_cubit/movie_details_cubit.dart';
import 'package:budget_tracker/presentation/bloc/movie_search_cubit/movie_search_cubit.dart';
import 'package:budget_tracker/presentation/login_screen.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/hive_storage.dart';
import 'data/network/movie_data_source.dart';
import 'data/repository/movie_repository.dart';

GetIt getIt = GetIt.instance;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  // Hive.registerAdapter(MovieCardAdapter());
  await Hive.openBox('movieDB');
  getIt.registerLazySingleton<HiveUtils>(() => HiveUtils());
  getIt.registerLazySingleton<MovieCubit>(() => MovieCubit());
  getIt.registerLazySingleton<MovieSearchCubit>(() => MovieSearchCubit());
  getIt.registerLazySingleton<Dio>(() => Dio());
  // getIt.registerLazySingleton<AppRouter>(() => AppRouter());
  getIt.registerLazySingleton<MovieDetailsCubit>(() => MovieDetailsCubit());
  getIt.registerLazySingleton<MovieRepository>(
          () => MovieRepository(MovieDataSource()));

  await getIt<HiveUtils>().initDb();
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
