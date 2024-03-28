import 'package:coolmovies/core/navigation/navigation_service.dart';
import 'package:coolmovies/core/navigation/routes.dart';
import 'package:coolmovies/domain/entities/movie.dart';
import 'package:coolmovies/presentation/pages/movie_details_page.dart';
import 'package:coolmovies/presentation/pages/movie_list_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings, NavigationService navigationService) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => MovieListPage(navigationService: navigationService));
      case Routes.details:
        Movie movie = settings.arguments as Movie;
        return MaterialPageRoute(builder: (_) => MovieDetailsPage(movie: movie));
      default:
        return null;
    }
  }
}