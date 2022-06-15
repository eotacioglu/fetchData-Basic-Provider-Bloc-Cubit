import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:getdata/product/views/bloc/home_bloc_view.dart';
import 'package:getdata/product/views/cubit/home_cubit_view.dart';
import 'package:getdata/product/views/home/home_view.dart';
import 'package:getdata/product/views/landing/landing_view.dart';
import 'package:getdata/product/views/provider/provider_view.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: LandingPage,
      initial: true,
    ),
    AutoRoute(
      page: HomePage,
    ),
    AutoRoute(page: HomeProviderPage),
    AutoRoute(page: HomeCubitPage),
    AutoRoute(page: HomeBlocPage),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
