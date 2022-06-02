import 'dart:convert';

import 'package:getdata/product/models/userModel/user.dart';
import 'package:getdata/product/views/cubit/ICubitService.dart';
import 'package:http/http.dart' as http;

class CubitService extends ICubitService {
//GET DATA TO LIST

  @override
  Future<List<UserModel>> getUserData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      List<dynamic> users = jsonDecode(response.body);
      // ignore: unnecessary_new
      return users.map((data) => new UserModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
}
