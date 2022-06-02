import 'package:flutter/material.dart';
import 'package:getdata/core/constants/app_constants.dart';

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
        title: const Text("Select get data method"),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return const HomePage();
                    }));
                  },
                  child: const Text(AppConstants.futureTitle)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return const ProviderPage();
                    }));
                  },
                  child: const Text(AppConstants.providerTitle)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return const HomeCubitPage();
                    }));
                  },
                  child: const Text(AppConstants.blocTitle)),
            ],
          ),
        ),
      ),
    );
  }
}
