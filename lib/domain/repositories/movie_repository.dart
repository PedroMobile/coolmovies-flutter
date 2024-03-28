import 'package:coolmovies/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getMovies();
}