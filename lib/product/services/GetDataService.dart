import 'dart:convert';

import 'package:getdata/core/constants/app_constants.dart';
import 'package:getdata/product/models/userModel/user.dart';
import 'package:getdata/product/services/IGetDataService.dart';
import 'package:http/http.dart' as http;

class GetDataService extends IGetDataService {
//GET DATA TO LIST

  @override
  Future<List<UserModel>> getUserData() async {
    final response = await http.get(Uri.parse(AppConstants.baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> users = jsonDecode(response.body);
      // ignore: unnecessary_new
      return users.map((data) => new UserModel.fromJson(data)).toList();
    } else {
      throw Exception('Kullanıcılar yüklenirken bir hata olutu');
    }
  }
}
