import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getdata/core/constants/app_constants.dart';
import 'package:getdata/core/services/alert/AlertService.dart';
import 'package:getdata/product/views/cubit/home_cubit.dart';
import 'package:getdata/product/services/GetDataService.dart';
import 'package:getdata/product/widgets/loading_widget.dart';

class HomeCubitPage extends StatefulWidget {
  const HomeCubitPage({Key? key}) : super(key: key);

  @override
  State<HomeCubitPage> createState() => _HomeCubitPageState();
}

class _HomeCubitPageState extends State<HomeCubitPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(GetDataService()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppConstants.cubitTitle),
        ),
        body: BlocConsumer<HomeCubit, CubitState>(builder: (context, state) {
          if (state is CubitComplated) {
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

          if (state is CubitLoading) {
            return const LoadingWidget();
          }
// Veriyi getirmek için buton da kullanabiliriz ama manuel tetiklenme istemediğim için Cubit servisin constructor kısmında veri çekme işlemini başlattım.
          return ElevatedButton(
              onPressed: () {
                context.read<HomeCubit>().fetchData();
              },
              child:
                  const Text("Bir sorun oluştu datayı çekmek için tıklayın."));
        }, listener: (context, state) {
          if (state is CubitError) {
            AlertService.instance.showAlert(state.errMessasge, Colors.green);
          }
        }),
      ),
    );
  }
}
