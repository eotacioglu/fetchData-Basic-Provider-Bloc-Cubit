import 'package:getdata/product/models/userModel/user.dart';

abstract class IGetDataService {
  Future<List<UserModel>> getUserData();
}
