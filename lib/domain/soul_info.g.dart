// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soul_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SoulInfoImpl _$$SoulInfoImplFromJson(Map<String, dynamic> json) =>
    _$SoulInfoImpl(
      backgroundColor: json['backgroundColor'] as int,
      buttonColor: json['buttonColor'] as int,
      outlineColor: json['outlineColor'] as int,
      soulNumber: json['soulNumber'] as int,
      keyword: json['keyword'] as String,
      crystal: json['crystal'] as String,
      soulColor: json['soulColor'] as String,
      soulCharacter: json['soulCharacter'] as String,
    );

Map<String, dynamic> _$$SoulInfoImplToJson(_$SoulInfoImpl instance) =>
    <String, dynamic>{
      'backgroundColor': instance.backgroundColor,
      'buttonColor': instance.buttonColor,
      'outlineColor': instance.outlineColor,
      'soulNumber': instance.soulNumber,
      'keyword': instance.keyword,
      'crystal': instance.crystal,
      'soulColor': instance.soulColor,
      'soulCharacter': instance.soulCharacter,
    };
