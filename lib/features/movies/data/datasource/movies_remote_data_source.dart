import 'package:dio/dio.dart';
import 'package:movies_clean_architecture/features/movies/data/model/movies_model.dart';

class MoviesRemoteDataSource {
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    Response response = await Dio().get(
        "https://api.themoviedb.org/3/movie/popular?api_key=e083b4e145a441087a670922acb059fc");

    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data["results"] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      return [];
    }
  }
}
