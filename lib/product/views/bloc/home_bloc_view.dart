import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getdata/core/constants/app_constants.dart';
import 'package:getdata/product/views/bloc/home_bloc.dart';
import 'package:getdata/product/services/GetDataService.dart';
import 'package:getdata/product/widgets/loading_widget.dart';

class HomeBlocPage extends StatefulWidget {
  const HomeBlocPage({Key? key}) : super(key: key);

  @override
  State<HomeBlocPage> createState() => _HomeBlocPageState();
}

class _HomeBlocPageState extends State<HomeBlocPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.blocTitle),
      ),
      body: Center(
        child: BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(GetDataService()),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeComplated) {
                return ListView.builder(
                    itemCount: state.users.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          dense: true,
                          title: Text(state.users[index].name),
                          subtitle: Text(state.users[index].email),
                        ),
                      );
                    });
              }

              // Buton kullanarak'da veriyi çağırabiliriz ama manuel tetikleme istemediğim için state HomeInitial olduğunda datayı çağırması için aşağıdaki fonksiyonu kullandım.
              if (state is HomeInitial) {
                context.read<HomeBloc>().add(GetDataEvent());
              }

              return const LoadingWidget();
            },
          ),
        ),
      ),
    );
  }
}
