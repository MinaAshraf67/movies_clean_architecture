import 'package:dartz/dartz.dart';
import 'package:movies_clean_architecture/core/error/failure.dart';
import 'package:movies_clean_architecture/features/movies/domain/entities/movies.dart';

import '../repository/base_movie_repository.dart';

class GetTopRatedMoviesUseCase {
  final BaseMoviesRepository baseMovieRepository;

  GetTopRatedMoviesUseCase({required this.baseMovieRepository});

  Future<Either<Failure, List<Movies>>> execute() async {
    return baseMovieRepository.getTopRatedMovies();
  }
}
