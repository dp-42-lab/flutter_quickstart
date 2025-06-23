import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import '../../modules/general/splash.page.dart';
import '../../modules/home/home.page.dart';
import '../../modules/profile/profile.page.dart';
import '../../modules/settings/settings.page.dart';
import '../../shared/components/navigation/main_navigation_wrapper.dart';

part 'app_routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  final _slideLeftTransition = TransitionsBuilders.slideLeft;
  final _fadeInTransition = TransitionsBuilders.fadeIn;

  @override
  List<AutoRoute> get routes => [
    CustomRoute(
      page: SplashRoute.page,
      initial: true,
      transitionsBuilder: _fadeInTransition,
    ),

    CustomRoute(
      page: MainRoute.page,
      path: '/',
      transitionsBuilder: _slideLeftTransition,
      children: [
        AutoRoute(page: HomeRoute.page, path: 'home'),
        AutoRoute(page: ProfileRoute.page, path: 'profile'),
        AutoRoute(page: SettingsRoute.page, path: 'settings'),
      ],
    ),
  ];
}
