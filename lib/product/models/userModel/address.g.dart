// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdressModel _$AdressModelFromJson(Map<String, dynamic> json) => AdressModel(
      json['street'] as String,
      json['suite'] as String,
      json['city'] as String,
      json['zipcode'] as String,
      GeoModel.fromJson(json['geo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AdressModelToJson(AdressModel instance) =>
    <String, dynamic>{
      'street': instance.street,
      'suite': instance.suite,
      'city': instance.city,
      'zipcode': instance.zipcode,
      'geo': instance.geo,
    };
