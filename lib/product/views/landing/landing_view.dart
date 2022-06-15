import 'package:flutter/material.dart';
import 'package:getdata/core/constants/app_constants.dart';
import 'package:getdata/core/extension/app_extension.dart';
import 'package:getdata/core/navigation/INavigationService.dart';
import 'package:getdata/core/navigation/navigation_service.dart';
import 'package:getdata/core/navigation/router.dart';
import 'package:getdata/product/locator.dart';

import 'package:getdata/product/views/cubit/home_cubit_view.dart';
import 'package:getdata/product/views/home/home_view.dart';
import 'package:getdata/product/views/provider/provider_view.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select a get data method"),
      ),
      body: Center(
        child: SizedBox(
          width: context.width,
          height: context.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    // NavigationService.instance
                    //     .navigateToPageNamed("/home-page");
                    getIt<AppRouter>().pushNamed("/home-page");
                  },
                  child: const Text(AppConstants.futureTitle)),
              ElevatedButton(
                  onPressed: () {
                    getIt<AppRouter>().pushNamed("/provider-page");
                  },
                  child: const Text(AppConstants.providerTitle)),
              ElevatedButton(
                  onPressed: () {
                    getIt<AppRouter>().pushNamed("/home-cubit-page");
                  },
                  child: const Text(AppConstants.cubitTitle)),
              ElevatedButton(
                  onPressed: () {
                    getIt<AppRouter>().pushNamed("/home-bloc-page");
                  },
                  child: const Text(AppConstants.blocTitle)),
            ],
          ),
        ),
      ),
    );
  }
}
