import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_clean_architecture/core/services/services_locator.dart';
import 'package:movies_clean_architecture/movies/data/datasource/movies_remote_data_source.dart';
import 'package:movies_clean_architecture/movies/data/repository/movies_repository.dart';
import 'package:movies_clean_architecture/movies/domain/entities/movies.dart';
import 'package:movies_clean_architecture/movies/domain/repository/base_movie_repository.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_now_playing_movies_use_case.dart';
import 'package:movies_clean_architecture/movies/presentation/controller/movies_bloc.dart';
import 'package:movies_clean_architecture/movies/presentation/controller/movies_event.dart';
import 'package:movies_clean_architecture/movies/presentation/controller/movies_state.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  List<Movies> movies = [];
  @override
  // void initState() {
  //   super.initState();
  //   _getData();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesBloc(sl())..add(GetNowPlayingMoviesEvent()),
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          print(state);
          return const Scaffold();
        },
      ),
    );
  }

  // void _getData() async {
  //   BaseMoviesRemoteDataSource baseMoviesRemoteDataSource =
  //       MoviesRemoteDataSource();
  //   BaseMoviesRepository baseMoviesRepository = MoviesRepository(
  //       baseMoviesRemoteDataSource: baseMoviesRemoteDataSource);
  //   final result = await GetNowPlayingMoviesUseCase(
  //           baseMoviesRepository: baseMoviesRepository)
  //       .execute();
  //   result.fold(
  //     (l) => null,
  //     (r) {
  //       movies = r;
  //     },
  //   );
  //   print(result);
  // }
}
