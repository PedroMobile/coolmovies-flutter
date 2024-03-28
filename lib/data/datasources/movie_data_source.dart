import 'package:coolmovies/domain/entities/movie.dart';

abstract class MovieDataSource {
  Future<List<Movie>> getMoviesFromAPI();
}