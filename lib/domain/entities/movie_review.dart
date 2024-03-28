import 'package:coolmovies/domain/entities/user.dart';

class MovieReview {
  final String title;
  final int rating;
  final String body;
  final User userByUserReviewerId;

  MovieReview({
    required this.title,
    required this.rating,
    required this.body,
    required this.userByUserReviewerId,
  });

  factory MovieReview.fromJson(Map<String, dynamic> json) {
    return MovieReview(
      title: json['title'],
      rating: json['rating'],
      body: json['body'],
      userByUserReviewerId: User.fromJson(json['userByUserReviewerId']),
    );
  }
}