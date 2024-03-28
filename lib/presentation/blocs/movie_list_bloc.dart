import 'package:coolmovies/domain/usecases/get_movies_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coolmovies/domain/entities/movie.dart';

class MovieListBloc extends Cubit<List<Movie>> {
  final GetMoviesUseCase _getMoviesUseCase;

  MovieListBloc(this._getMoviesUseCase) : super([]);

  void fetchMovies() async {
    final movies = await _getMoviesUseCase.execute();
    emit(movies);
  }
}