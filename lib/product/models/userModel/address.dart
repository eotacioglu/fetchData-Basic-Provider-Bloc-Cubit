import 'package:json_annotation/json_annotation.dart';

import 'geo.dart';

part 'address.g.dart';

@JsonSerializable()
class AdressModel {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final GeoModel geo;

  AdressModel(this.street, this.suite, this.city, this.zipcode, this.geo);
  factory AdressModel.fromJson(Map<String, dynamic> json) =>
      _$AdressModelFromJson(json);
  Map<String, dynamic> toJson() => _$AdressModelToJson(this);
}
