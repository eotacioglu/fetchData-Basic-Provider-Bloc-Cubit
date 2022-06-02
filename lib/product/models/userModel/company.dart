import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';


@JsonSerializable()
class CompanyModel {
  final String name;
  final String catchPhrase;
  final String bs;

  CompanyModel(this.name, this.catchPhrase, this.bs);

  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyModelToJson(this);
}
