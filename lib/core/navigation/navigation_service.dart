// Class responsible for navigation
import 'package:flutter/material.dart';

class NavigationService {

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // Method to navigate to a specific screen
  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  // Method to go back to the previous screen
  void goBack() {
    return navigatorKey.currentState!.pop();
  }
}