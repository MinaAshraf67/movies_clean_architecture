import 'package:movies_clean_architecture/features/movies/domain/entities/movies.dart';

abstract class BaseMovieRepository {
  Future<List<Movies>> getNowPlayingMovies();
  Future<List<Movies>> getPopularMovies();
  Future<List<Movies>> getTopRatedMovies();
}
