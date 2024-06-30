import 'package:dartz/dartz.dart';
import 'package:movies_clean_architecture/core/error/failure.dart';
import 'package:movies_clean_architecture/features/movies/domain/entities/movies.dart';
import 'package:movies_clean_architecture/features/movies/domain/repository/base_movie_repository.dart';

class GetPopularMoviesUseCase {
  final BaseMoviesRepository baseMovieRepository;

  GetPopularMoviesUseCase({required this.baseMovieRepository});

  Future<Either<Failure, List<Movies>>> execute() async {
    return await baseMovieRepository.getPopularMovies();
  }
}
