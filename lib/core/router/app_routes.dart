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
  final _slideBottomTransition = TransitionsBuilders.slideBottom;

  @override
  List<AutoRoute> get routes => [
    CustomRoute(page: SplashRoute.page, initial: true, transitionsBuilder: TransitionsBuilders.fadeIn),
    ..._getDefaultTransitionRoutes(),
  ];

  List<AutoRoute> _getDefaultTransitionRoutes() {
    return [
      CustomRoute(
        page: HomeRoute.page,
        path: '/',
        transitionsBuilder: _slideLeftTransition,
      ),
      CustomRoute(
        page: SettingsRoute.page,
        path: '/settings',
        transitionsBuilder: _slideLeftTransition,
      ),
      CustomRoute(
        page: ProfileRoute.page,
        path: '/profile',
        transitionsBuilder: _slideLeftTransition,
      ),
      CustomRoute(page: MainRoute.page, transitionsBuilder: _slideLeftTransition),
    ];
  }
}
