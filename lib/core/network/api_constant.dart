class ApiConstant {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "e083b4e145a441087a670922acb059fc";
  static const String nowPlayingMoviesEndPoint =
      "$baseUrl/movie/now_playing&api_key=$apiKey";
  static const String popularMoviesEndpoint =
      "$baseUrl/movie/popular&api_key=$apiKey";
  static const String topRatedMoviesEndpoint =
      "$baseUrl/movie/top_rated&api_key=$apiKey";
}
