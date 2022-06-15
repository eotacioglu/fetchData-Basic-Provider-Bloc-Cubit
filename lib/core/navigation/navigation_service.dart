import 'package:flutter/src/widgets/framework.dart';
import 'package:get_it/get_it.dart';
import 'package:getdata/core/navigation/INavigationService.dart';
import 'package:getdata/core/navigation/router.dart';


class NavigationService implements INavigationService {
  late final getIt;
  static final NavigationService _instance = NavigationService.init();
  static NavigationService get instance => _instance;

  NavigationService.init() {
    getIt = GetIt.instance;
  }

  @override
  Future<void> navigateToPageClear(String? path) async {
    getIt<AppRouter>().replaceNamed(path!);
  }

  @override
  Future<void> navigateToPageNamed(String? path) async {
    await getIt<AppRouter>().pushNamed(path!);
  }

  @override
  Future<void> navigateToPageWidget(Widget? widget) async {
    await getIt<AppRouter>().pushWidget(widget!);
  }

  @override
  Future<void> popContext() async {
    await getIt<AppRouter>().pop();
  }
}
