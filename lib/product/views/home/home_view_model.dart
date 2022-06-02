import 'dart:convert';


import 'package:getdata/product/models/userModel/user.dart';
import 'package:http/http.dart' as http;

class HomeViewModel {
  static final HomeViewModel _instace = HomeViewModel._init();
  static HomeViewModel get instance => _instace;
  HomeViewModel._init();


//GET DATA TO LIST

  Future<List<UserModel>> fetchUser() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      List users = jsonDecode(response.body);
      // ignore: unnecessary_new
      return users.map((data) => new UserModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
}
