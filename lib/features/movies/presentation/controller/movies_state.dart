// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:movies_clean_architecture/core/utils/enums.dart';
import 'package:movies_clean_architecture/features/movies/domain/entities/movies.dart';

class MoviesState extends Equatable {
  final List<Movies> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;

  const MoviesState(
      {this.nowPlayingMovies = const [],
      this.nowPlayingState = RequestState.loading,
      this.nowPlayingMessage = ''});

  @override
  List<Object> get props =>
      [nowPlayingMovies, nowPlayingState, nowPlayingMessage];
}
