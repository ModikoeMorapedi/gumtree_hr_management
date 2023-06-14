import 'package:flutter/material.dart';
import 'package:gumtree_hr_management/services/navigation/i_navigation_service.dart';

class NavigationService implements INavigationServies {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  @override
  goBack() {
    return navigatorKey.currentState!.pop();
  }

  @override
  Future<dynamic> navigateToArgs(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }
}
