import 'package:flutter/material.dart';
import 'package:my_diary/screens/home/home.dart';

import '../screens/signin/sign_in_countries_page.dart';
import '../screens/signin/sign_in_phone_page.dart';
import '../screens/signin/sign_in_verification_model.dart';
import '../screens/startup_page/startup_page.dart';

class AppRoutes {
  static const startupPage = '/startup-page';
  static const countriesPage = '/countries-page';
  static const signInPhonePage = '/sign-in-phone-page';
  static const signInVerificationPage = '/sign-in-verification-page';
  static const homePage = '/home-page';
}

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.startupPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => StartupPage(),
          settings: settings,
        );
      case AppRoutes.countriesPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => CountriesPage(),
          settings: settings,
          fullscreenDialog: true,
        );
      case AppRoutes.signInPhonePage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => SignInPhonePageBuilder(),
          settings: settings,
        );
      case AppRoutes.signInVerificationPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => SignInVerificationPageBuilder(),
          settings: settings,
        );
        case AppRoutes.homePage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => HomePage(),
          settings: settings,
        );
      default:
        return null;
    }
  }
}