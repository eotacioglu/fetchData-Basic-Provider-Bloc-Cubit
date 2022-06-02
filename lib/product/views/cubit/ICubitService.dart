import 'package:getdata/product/models/userModel/user.dart';

abstract class ICubitService {
  Future<List<UserModel>> getUserData();
}
