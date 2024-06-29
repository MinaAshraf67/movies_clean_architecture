import 'package:movies_clean_architecture/features/movies/domain/entities/movies.dart';

import '../repository/base_movie_repository.dart';

class GetTopRatedMoviesUseCase {
  final BaseMovieRepository baseMovieRepository;

  GetTopRatedMoviesUseCase({required this.baseMovieRepository});

  Future<List<Movies>> execute() async {
    return baseMovieRepository.getTopRatedMovies();
  }
}
