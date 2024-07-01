import 'package:movies_clean_architecture/core/network/api_constant.dart';

class ApiEndpoints {
  static const String nowPlayingMoviesEndPoint =
      "${ApiConstant.baseUrl}/movie/now_playing";
  static const String popularMoviesEndpoint =
      "${ApiConstant.baseUrl}/movie/popular";
  static const String topRatedMoviesEndpoint =
      "${ApiConstant.baseUrl}/movie/top_rated";
}
