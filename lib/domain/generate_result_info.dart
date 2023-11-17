import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kg_meet_tpe/constants/constant.dart';
import 'package:kg_meet_tpe/domain/soul_info.dart';
import 'package:kg_tools/kg_tools.dart';

part 'generate_result_info.freezed.dart';

part 'generate_result_info.g.dart';

@freezed
class GenerateResultInfo with _$GenerateResultInfo {
  const GenerateResultInfo._();

  const factory GenerateResultInfo({
    required String name,
    required String birth,
    required String address,
    String? privateKey,
  }) = _GenerateResultInfo;

  int get soulNumber {
    final birthDate = DateTime.parse(birth);
    var birthList = [birthDate.year, birthDate.day, birthDate.month];
    while (birthList.length > 1) {
      birthList = birthList
          .fold(0, (sum, digit) => sum + digit)
          .toString()
          .split('')
          .map(int.parse)
          .toList();
    }
    return birthList.first;
  }

  String get formattedAddress => address.toFormattedAddress();

  SoulInfo get soulInfo => soulConstant[soulNumber]!;

  String get encodedSoulInfo {
    final encodeInfo = copyWith(privateKey: null);
    String jsonString = jsonEncode(encodeInfo.toJson());

    List<int> bytes = utf8.encode(jsonString);
    return base64Encode(bytes);
  }

  factory GenerateResultInfo.fromEncodedSoulInfo(String encodedSoulInfo) {
    Uint8List bytes = Uint8List.fromList(base64Decode(encodedSoulInfo));

    String jsonString = utf8.decode(bytes);

    return GenerateResultInfo.fromJson(jsonDecode(jsonString));
  }

  factory GenerateResultInfo.fromJson(dynamic json) =>
      _$GenerateResultInfoFromJson(json);
}
