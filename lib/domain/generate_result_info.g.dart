// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_result_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenerateResultInfoImpl _$$GenerateResultInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$GenerateResultInfoImpl(
      name: json['name'] as String,
      birth: json['birth'] as String,
      address: json['address'] as String,
      privateKey: json['privateKey'] as String?,
    );

Map<String, dynamic> _$$GenerateResultInfoImplToJson(
        _$GenerateResultInfoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'birth': instance.birth,
      'address': instance.address,
      'privateKey': instance.privateKey,
    };
