import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_clean_architecture/core/utils/enums.dart';
import 'package:movies_clean_architecture/movies/data/datasource/movies_remote_data_source.dart';
import 'package:movies_clean_architecture/movies/data/repository/movies_repository.dart';
import 'package:movies_clean_architecture/movies/domain/repository/base_movie_repository.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_now_playing_movies_use_case.dart';
import 'package:movies_clean_architecture/movies/presentation/controller/movies_event.dart';
import 'package:movies_clean_architecture/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  MoviesBloc(this.getNowPlayingMoviesUseCase) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase.execute();
      emit(const MoviesState(nowPlayingState: RequestState.loaded));
      result.fold(
        (l) => emit(
          MoviesState(
              nowPlayingState: RequestState.error,
              nowPlayingMessage: l.message),
        ),
        (r) => emit(MoviesState(
          nowPlayingMovies: r,
          nowPlayingState: RequestState.loaded,
        )),
      );
    });
  }
}
