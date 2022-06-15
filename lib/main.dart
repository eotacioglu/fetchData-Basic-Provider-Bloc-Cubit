import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getdata/core/navigation/router.dart';
import 'package:getdata/product/views/bloc/home_bloc.dart';
import 'package:getdata/product/views/cubit/home_cubit.dart';
import 'package:getdata/product/services/GetDataService.dart';
import 'package:getdata/product/views/landing/landing_view.dart';
import 'package:getdata/product/views/provider/provider_view.dart';
import 'package:getdata/product/views/provider/provider_view_model.dart';
import 'package:provider/provider.dart';

import 'product/locator.dart';

Future<void> main() async {
  voidStart();
  runApp(MultiProvider(providers: [
    RepositoryProvider(
      create: (_) => HomeCubit(GetDataService()).fetchData(),
    ),
    ChangeNotifierProvider(
      create: (_) => ProviderViewModel(),
    ),
    BlocProvider(create: (context) => HomeBloc(GetDataService()))
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appRouter = getIt<AppRouter>();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
    );
  }
}
