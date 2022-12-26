import 'package:flutter/material.dart';
import 'package:flutter_template/app/di.dart';
import 'package:flutter_template/presentation/login/login_screen.dart';
import 'package:flutter_template/presentation/onboarding/onboarding_screen.dart';
import 'package:flutter_template/presentation/splash/splash_screen.dart';
import 'package:flutter_template/resource/string_manager.dart';

import '../presentation/main/main_screen.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onboarding";
  static const String loginRoute = "/login";
  static const String mainRoute = "/main";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingView());
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => MainScreen());
      default:
        return UnDefinedRoute();
    }
  }

  static Route<dynamic> UnDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}
