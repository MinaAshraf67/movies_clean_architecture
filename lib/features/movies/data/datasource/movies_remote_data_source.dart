import 'package:dio/dio.dart';
import 'package:movies_clean_architecture/core/error/exceptions.dart';
import 'package:movies_clean_architecture/core/network/api_constant.dart';
import 'package:movies_clean_architecture/core/network/error_message_model.dart';
import 'package:movies_clean_architecture/features/movies/data/model/movies_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MoviesModel>> getNowPlayingMovies();
  Future<List<MoviesModel>> getPopularMovies();
  Future<List<MoviesModel>> getTopRatedMovies();
}

class MoviesRemoteDataSource implements BaseMovieRemoteDataSource {
  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    Response response = await Dio().get(ApiConstant.nowPlayingMoviesEndPoint);

    if (response.statusCode == 200) {
      return List<MoviesModel>.from(
        (response.data["results"] as List).map(
          (e) => MoviesModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    Response response = await Dio().get(ApiConstant.popularMoviesEndpoint);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from(
        (response.data["results"] as List).map(
          (e) => MoviesModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies() async {
    Response response = await Dio().get(ApiConstant.topRatedMoviesEndpoint);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from(
        (response.data["results"] as List).map(
          (e) => MoviesModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
