import 'package:advanced_ecommerse/lib/core/resources/manager_strings.dart';
import 'package:advanced_ecommerse/lib/featutres/cart/presntation/view/cart_view.dart';
import 'package:advanced_ecommerse/lib/featutres/settings/presentation/view/screen/settings_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/dependancy_injection.dart';
import '../featutres/authntication/presntaion/view/login_view.dart';
import '../featutres/authntication/presntaion/view/register_view.dart';
import '../featutres/home/presntation/view/home_view.dart';
import '../featutres/outboarding/presntation/view/outboarding_view.dart';
import '../featutres/product_destails/presntation/details_view.dart';
import '../featutres/profile/presntation/view/profile_view.dart';
import '../featutres/splash/presntation/view/splash_screen.dart';

class Routes {
  static const String splashScreen = '/splash_screen';
  static const String languagePage = '/language_page';
  static const String homeView = '/homeView';
  static const String outBoarding = '/outBoardingView';
  static const String loginView = '/loginView';
  static const String registerView = '/registerView';
  static const String profileView = '/profileView';
  static const String detailsView = '/detailsView';
  static const String settingsView = '/settingsView';
  static const String cartView = '/cartView';
  static const String brandView = '/brandView';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        initSplash();
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      // case Routes.languagePage:
      //   return MaterialPageRoute(builder: (_) => const LanguagePage());
      case Routes.outBoarding:
        return MaterialPageRoute(builder: (_) => const OutBoardingView());
      case Routes.loginView:
        initAuth();
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.registerView:
        initAuth();
        return MaterialPageRoute(builder: (_) => RegisterView());
      case Routes.homeView:
        initHome();
        return MaterialPageRoute(builder: (_) => HomeView());
      case Routes.profileView:
        initProfile();
        return MaterialPageRoute(builder: (_) =>  ProfileView());
        case Routes.settingsView:
        initSettings();
        return MaterialPageRoute(builder: (_) =>  SettingsView());
      case Routes.detailsView:
        initHome();
        return MaterialPageRoute(builder: (_) =>  DetailsView());
      case Routes.cartView:
        initHome();
        return MaterialPageRoute(builder: (_) =>  CartView());
      // case Routes.localeView:
      //   initLocale();
      //
      //   return MaterialPageRoute(builder: (_) =>  LocaleView());

      default:
        return unDefineRoute();
    }
  }

  static Route<dynamic> unDefineRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text(ManagerStrings.notFoundRoute),
        ),
      ),
    );
  }
}
