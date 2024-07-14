import 'package:amcart/features/auth/screens/auth_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> genrateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const AuthScreen(),
      );

    default:
      return MaterialPageRoute(
          builder: (context) =>
              const Scaffold(body: Center(child: Text("InValid Page"))));
  }
}
