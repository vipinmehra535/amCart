import 'package:amcart/common/widgets/bottom_bar.dart';
import 'package:amcart/features/auth/screens/auth_screen.dart';
import 'package:amcart/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> genrateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const AuthScreen(),
      );

    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        builder: (context) => const BottomBar(),
      );

    default:
      return MaterialPageRoute(
          builder: (context) =>
              const Scaffold(body: Center(child: Text("InValid Page"))));
  }
}
