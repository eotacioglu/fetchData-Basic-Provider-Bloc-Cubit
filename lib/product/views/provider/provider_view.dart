import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getdata/core/constants/app_constants.dart';
import 'package:getdata/product/views/provider/provider_view_model.dart';
import 'package:getdata/product/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

class ProviderPage extends StatefulWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  State<ProviderPage> createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  final ProviderViewModel _getDataService = ProviderViewModel();

  @override
  void initState() {
    super.initState();
    _getDataService.fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: _getDataService,
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(AppConstants.providerTitle),
            ),
            body: Consumer<ProviderViewModel>(
              builder: (context, data, child) {
                if (data.isLoading != true) {
                  return ListView.builder(
                      itemCount: data.users.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            dense: true,
                            title: Text(data.users[index].name),
                            subtitle: Text(data.users[index].email),
                          ),
                        );
                      });
                }

                return const LoadingWidget();
              },
            ),
          );
        });
  }
}
