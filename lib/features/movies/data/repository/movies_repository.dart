import 'package:dartz/dartz.dart';
import 'package:movies_clean_architecture/core/error/exceptions.dart';
import 'package:movies_clean_architecture/core/error/failure.dart';
import 'package:movies_clean_architecture/features/movies/data/datasource/movies_remote_data_source.dart';
import 'package:movies_clean_architecture/features/movies/domain/entities/movies.dart';
import 'package:movies_clean_architecture/features/movies/domain/repository/base_movie_repository.dart';

class MoviesRepository implements BaseMoviesRepository {
  final BaseMoviesRemoteDataSource baseMoviesRemoteDataSource;

  MoviesRepository({required this.baseMoviesRemoteDataSource});
  @override
  Future<Either<Failure, List<Movies>>> getNowPlayingMovies() async {
    final result = await baseMoviesRemoteDataSource.getNowPlayingMovies();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          message: failure.errorMessageModel.statusMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getPopularMovies() async {
    final result = await baseMoviesRemoteDataSource.getPopularMovies();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getTopRatedMovies() async {
    var result = await baseMoviesRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }
}
