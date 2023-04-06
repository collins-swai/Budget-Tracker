import 'package:equatable/equatable.dart';

import '../../../core/models/movie_details_model.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();
}

class MovieDetailsInitial extends MovieDetailsState {
  @override
  List<Object> get props => [];
}

class MovieDetailsFetched extends MovieDetailsState {
  final MovieDetailsModel movieDetailsModel;

  const MovieDetailsFetched(this.movieDetailsModel);
  @override
  List<Object?> get props => [movieDetailsModel];
}