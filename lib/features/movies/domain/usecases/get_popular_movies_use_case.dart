import 'package:movies_clean_architecture/features/movies/domain/entities/movies.dart';
import 'package:movies_clean_architecture/features/movies/domain/repository/base_movie_repository.dart';

class GetPopularMoviesUseCase {
  final BaseMovieRepository baseMovieRepository;

  GetPopularMoviesUseCase({required this.baseMovieRepository});

  Future<List<Movies>> execute() async {
    return await baseMovieRepository.getPopularMovies();
  }
}
