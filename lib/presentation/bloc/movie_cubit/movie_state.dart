import 'package:budget_tracker/core/models/movie_models.dart';
import 'package:equatable/equatable.dart';

abstract class MovieState extends Equatable {
  const MovieState();
}

class MovieInitial extends MovieState {
  @override
  List<Object> get props => [];
}

class MovieFetched extends MovieState {
  const MovieFetched(this.moviesCard);
  final List<MovieCardModel> moviesCard;
  @override
  List<Object> get props => [moviesCard];
}