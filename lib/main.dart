import 'package:coolmovies/core/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:coolmovies/core/navigation/navigation_service.dart';
import 'package:coolmovies/core/navigation/routes.dart';
import 'package:coolmovies/presentation/pages/movie_list_page.dart';

void main() async {
  final NavigationService navigationService = NavigationService();

  runApp(MaterialApp(
    home: MaterialApp(
      navigatorKey: navigationService.navigatorKey,
      onGenerateRoute: (settings) => AppRouter.generateRoute(settings, navigationService),
      initialRoute: Routes.home,
    ),
  ));
}

