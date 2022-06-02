import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getdata/product/views/cubit/home_cubit.dart';
import 'package:getdata/product/views/cubit/home_cubit_service.dart';
import 'package:getdata/product/views/landing/landing_view.dart';

Future<void> main() async {
  runApp(MultiRepositoryProvider(providers: [
    RepositoryProvider(
      create: (_) => HomeCubit(CubitService()).fetchData(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const LandingPage(),
    );
  }
}
