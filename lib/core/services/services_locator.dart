import 'package:get_it/get_it.dart';
import 'package:movies_clean_architecture/features/movies/data/datasource/movies_remote_data_source.dart';
import 'package:movies_clean_architecture/features/movies/data/repository/movies_repository.dart';
import 'package:movies_clean_architecture/features/movies/domain/repository/base_movie_repository.dart';
import 'package:movies_clean_architecture/features/movies/domain/usecases/get_now_playing_movies_use_case.dart';
import 'package:movies_clean_architecture/features/movies/presentation/controller/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    sl.registerFactory(
      () => MoviesBloc(sl()),
    );
    // Usecases
    sl.registerLazySingleton(
      () => GetNowPlayingMoviesUseCase(baseMoviesRepository: sl()),
    );

    // Repository

    sl.registerLazySingleton<BaseMoviesRepository>(
      () => MoviesRepository(baseMoviesRemoteDataSource: sl()),
    );

    // DATA SOURCE
    sl.registerLazySingleton<BaseMoviesRemoteDataSource>(
      () => MoviesRemoteDataSource(),
    );
  }
}
