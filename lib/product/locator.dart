import 'package:get_it/get_it.dart';
import 'package:getdata/core/navigation/router.dart';

final getIt = GetIt.instance;
voidStart() {
  getIt.registerSingleton<AppRouter>(AppRouter());
}
