import 'package:movies_clean_architecture/features/movies/domain/entities/movies.dart';

class MoviesModel extends Movies {
  const MoviesModel(
      {required super.backdropPath,
      required super.id,
      required super.title,
      required super.overview,
      required super.releaseDate,
      required super.voteAverage,
      required super.genereIds});

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
        backdropPath: json['backdrop_path'],
        id: json['id'],
        title: json['title'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        voteAverage: json['vote_average'].toDouble(),
        genereIds: List<int>.from(
          json['genre_ids'].map((e) => e),
        ),
      );
}
