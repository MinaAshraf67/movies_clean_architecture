import 'package:dio/dio.dart';
import 'package:movies_clean_architecture/core/error/exceptions.dart';
import 'package:movies_clean_architecture/core/network/api_endpoints.dart';
import 'package:movies_clean_architecture/core/network/error_message_model.dart';
import 'package:movies_clean_architecture/movies/data/model/movies_model.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<List<MoviesModel>> getNowPlayingMovies();
  Future<List<MoviesModel>> getPopularMovies();
  Future<List<MoviesModel>> getTopRatedMovies();
}

class MoviesRemoteDataSource implements BaseMoviesRemoteDataSource {
  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    Response response = await Dio().get(ApiEndpoints.nowPlayingMoviesEndPoint,
        options: Options(headers: {
          "accept": 'application/json',
          "Authorization":
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlMDgzYjRlMTQ1YTQ0MTA4N2E2NzA5MjJhY2IwNTlmYyIsIm5iZiI6MTcxOTc2ODk1My4yNjMzODMsInN1YiI6IjY2ODAwMTkzMmRhNDY0NDEyMWE4NGI2NCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.dxyd1jRNl8S_kc-IhoeSoDotSQ5aGIn1eDv8fdWmjaI'
        }));

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
    Response response = await Dio().get(ApiEndpoints.popularMoviesEndpoint);
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
    Response response = await Dio().get(ApiEndpoints.topRatedMoviesEndpoint);
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
