import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getdata/product/models/userModel/user.dart';

import 'package:http/http.dart' as http;

class ProviderViewModel with ChangeNotifier {
  late int _a = 0;
  get a => this._a;

  set a(value) {
    this._a = value;

    notifyListeners();
  }

  List<UserModel> _users = [];
  List<UserModel> get users => _users;
  set users(List<UserModel> users) {
    _users = users;
    notifyListeners();
  }

  late bool _isLoading = false;
  get isLoading => _isLoading;

  set isLoading(value) {
    _isLoading = value;
    notifyListeners();
  }

//GET DATA TO LIST

  Future<void> fetchUser() async {
    _changeLoading();
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      users = body.map((data) => UserModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load users');
    }

    _changeLoading();
  }

  void _changeLoading() => isLoading = !isLoading;

  void arttir() => a++;
  void azalt() => a >= 1 ? a-- : null;
}
