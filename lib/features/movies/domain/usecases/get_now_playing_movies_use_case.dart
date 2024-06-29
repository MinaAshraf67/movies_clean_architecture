import 'package:movies_clean_architecture/features/movies/domain/entities/movies.dart';
import 'package:movies_clean_architecture/features/movies/domain/repository/base_movie_repository.dart';

class GetNowPlayingMoviesUseCase {
  final BaseMovieRepository baseMovieRepository;

  GetNowPlayingMoviesUseCase({required this.baseMovieRepository});

  Future<List<Movies>> execute() async {
    return await baseMovieRepository.getNowPlayingMovies();
  }
}
