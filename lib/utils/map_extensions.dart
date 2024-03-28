import 'package:coolmovies/domain/entities/user.dart';

extension MapExtensions on Map<String, dynamic> {
  User toUser() => User.fromJson(this);
}