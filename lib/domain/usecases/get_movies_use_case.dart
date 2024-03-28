import 'package:coolmovies/domain/entities/movie.dart';
import 'package:coolmovies/domain/repositories/movie_repository.dart';

class GetMoviesUseCase {
  final MovieRepository _repository;

  GetMoviesUseCase(this._repository);

  Future<List<Movie>> execute() async {
    return _repository.getMovies();
  }
}