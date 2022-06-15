// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    LandingRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LandingPage());
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomePage());
    },
    ProviderRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomeProviderPage());
    },
    HomeCubitRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomeCubitPage());
    },
    HomeBlocRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomeBlocPage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(LandingRoute.name, path: '/'),
        RouteConfig(HomeRoute.name, path: '/home-page'),
        RouteConfig(ProviderRoute.name, path: '/provider-page'),
        RouteConfig(HomeCubitRoute.name, path: '/home-cubit-page'),
        RouteConfig(HomeBlocRoute.name, path: '/home-bloc-page')
      ];
}

/// generated route for
/// [LandingPage]
class LandingRoute extends PageRouteInfo<void> {
  const LandingRoute() : super(LandingRoute.name, path: '/');

  static const String name = 'LandingRoute';
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-page');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [HomeProviderPage]
class ProviderRoute extends PageRouteInfo<void> {
  const ProviderRoute() : super(ProviderRoute.name, path: '/provider-page');

  static const String name = 'ProviderRoute';
}

/// generated route for
/// [HomeCubitPage]
class HomeCubitRoute extends PageRouteInfo<void> {
  const HomeCubitRoute() : super(HomeCubitRoute.name, path: '/home-cubit-page');

  static const String name = 'HomeCubitRoute';
}

/// generated route for
/// [HomeBlocPage]
class HomeBlocRoute extends PageRouteInfo<void> {
  const HomeBlocRoute() : super(HomeBlocRoute.name, path: '/home-bloc-page');

  static const String name = 'HomeBlocRoute';
}
