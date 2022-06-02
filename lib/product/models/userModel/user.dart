import 'package:json_annotation/json_annotation.dart';

import 'address.dart';
import 'company.dart';

part 'user.g.dart';

@JsonSerializable()
class UserModel {
  final String name;
  final String username;
  final String email;
  final AdressModel address;
  final String phone;
  final String website;
  final CompanyModel company;

  UserModel(this.name, this.username, this.email, this.address, this.phone,
      this.website, this.company);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
