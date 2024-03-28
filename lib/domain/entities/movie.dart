import 'package:coolmovies/domain/entities/movie_review.dart';
import 'package:coolmovies/domain/entities/user.dart';

class Movie {
  final String id;
  final String imgUrl;
  final String title;
  final String releaseDate;
  final User userByUserCreatorId;
  final User movieDirectorByMovieDirectorId;
  final List<MovieReview> movieReviewsByMovieId;

  Movie({
    required this.id,
    required this.imgUrl,
    required this.title,
    required this.releaseDate,
    required this.userByUserCreatorId,
    required this.movieDirectorByMovieDirectorId,
    required this.movieReviewsByMovieId,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    var reviewsList = json['movieReviewsByMovieId']['nodes'] as List;
    List<MovieReview> reviews = reviewsList.map((i) => MovieReview.fromJson(i)).toList();

    return Movie(
      id: json['id'],
      imgUrl: json['imgUrl'],
      title: json['title'],
      releaseDate: json['releaseDate'],
      userByUserCreatorId: User.fromJson(json['userByUserCreatorId']),
      movieDirectorByMovieDirectorId: User.fromJson(json['movieDirectorByMovieDirectorId']),
      movieReviewsByMovieId: reviews,
    );
  }

}