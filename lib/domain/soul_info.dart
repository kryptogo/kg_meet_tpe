import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kg_meet_tpe/generated/assets.gen.dart';
import 'package:kg_platform_interface/kg_platform_interface.dart';

part 'soul_info.freezed.dart';
part 'soul_info.g.dart';

@freezed
class SoulInfo with _$SoulInfo {

  const SoulInfo._();
  
  const factory SoulInfo({
    required int walletPrimaryColor,
    required int backgroundColor,
    required int buttonColor,
    required int outlineColor,
    required int soulNumber,
    required String keyword,
    required String crystal,
    required String soulColor,
    required String soulCharacter,
  }) = _SoulInfo;


  AssetGenImage get assetImage {
    switch(soulNumber){
      case 1:
        return Assets.soul1;
      case 2:
        return Assets.soul2;
      case 3:
        return Assets.soul3;
      case 4:
        return Assets.soul4;
      case 5:
        return Assets.soul5;
      case 6:
        return Assets.soul6;
      case 7:
        return Assets.soul7;
      case 8:
        return Assets.soul8;
      case 9:
        return Assets.soul9;
    }
    return Assets.soul1;
  }

  factory SoulInfo.fromJson(dynamic json) =>
      _$SoulInfoFromJson(json);
}