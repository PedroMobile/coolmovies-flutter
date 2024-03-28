import 'package:coolmovies/data/datasources/movie_data_source.dart';
import 'package:coolmovies/domain/entities/movie.dart';
import 'package:coolmovies/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource dataSource;

  MovieRepositoryImpl(this.dataSource);

  @override
  Future<List<Movie>> getMovies() async {
    return dataSource.getMoviesFromAPI();
  }
}