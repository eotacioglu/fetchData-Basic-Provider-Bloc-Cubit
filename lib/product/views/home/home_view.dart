import 'package:flutter/material.dart';
import 'package:getdata/core/constants/app_constants.dart';
import 'package:getdata/product/models/userModel/user.dart';
import 'package:getdata/product/views/home/home_view_model.dart';
import 'package:getdata/product/widgets/loading_widget.dart';

//GET DATA FUTURE BUILDER

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<UserModel>> users;

  @override
  void initState() {
    super.initState();
    users = HomeViewModel.instance.fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.futureTitle),
      ),
      body: FutureBuilder<List<UserModel>>(
        future: users,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  final data = snapshot.data![index];
                  bool selected = false;

                  return Card(
                    child: ListTile(
                      onTap: () {},
                      dense: true,
                      title: Text("${data.name} " " ${data.username}"),
                      subtitle: Text(data.address.city),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const LoadingWidget();
        },
      ),
    );
  }
}
