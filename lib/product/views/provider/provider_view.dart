import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getdata/core/constants/app_constants.dart';
import 'package:getdata/core/extension/app_extension.dart';
import 'package:getdata/product/views/provider/provider_view_model.dart';
import 'package:getdata/product/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

class HomeProviderPage extends StatefulWidget {
  const HomeProviderPage({Key? key}) : super(key: key);

  @override
  State<HomeProviderPage> createState() => _HomeProviderPageState();
}

class _HomeProviderPageState extends State<HomeProviderPage> {
  final ProviderViewModel _getDataService = ProviderViewModel();

  @override
  void initState() {
    super.initState();
    _getDataService.fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ChangeNotifierProvider.value(
              value: _getDataService,
              builder: (context, child) {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text(AppConstants.providerTitle),
                  ),
                  body: Consumer<ProviderViewModel>(
                    builder: (context, data, child) {
                      if (data.isLoading != true) {
                        return Column(
                          children: [
                            Expanded(
                              flex: 3,
                              child: ListView.builder(
                                  itemCount: data.users.length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      child: ListTile(
                                        dense: true,
                                        title: Text(data.users[index].name),
                                        subtitle: Text(data.users[index].email),
                                      ),
                                    );
                                  }),
                            ),
                            Expanded(child: const CounterPage())
                          ],
                        );
                      }

                      return const LoadingWidget();
                    },
                  ),
                );
              }),
        ),
      ],
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: () => context.read<ProviderViewModel>().arttir(),
          child: Text("Arttır"),
        ),
        ElevatedButton(
          onPressed: () => context.read<ProviderViewModel>().azalt(),
          child: Text("Azalt"),
        ),
        Center(
            child: Text(
          context.watch<ProviderViewModel>().a.toString(),
          style: TextStyle(fontSize: 30),
        ))
      ],
    ));
  }
}
