// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Movies extends Equatable {
  final String backdropPath;
  final int id;
  final String title;
  final String overview;
  final String releaseDate;
  final double voteAverage;
  final List<int> genereIds;

  const Movies(
      {required this.backdropPath,
      required this.id,
      required this.title,
      required this.overview,
      required this.releaseDate,
      required this.voteAverage,
      required this.genereIds});

  @override
  List<Object> get props {
    return [
      backdropPath,
      id,
      title,
      overview,
      releaseDate,
      voteAverage,
      genereIds,
    ];
  }
}
