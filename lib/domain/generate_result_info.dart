import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kg_meet_tpe/constants/constant.dart';
import 'package:kg_meet_tpe/domain/soul_info.dart';

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
    var birthList = [birthDate.day, birthDate.month];
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

  SoulInfo get soulInfo => soulConstant[soulNumber]!;

  String get hex {
    final encodeInfo = copyWith(privateKey: null);
    // Serialize the object to JSON
    String jsonString = jsonEncode(encodeInfo.toJson());

    // Convert JSON string to bytes
    List<int> bytes = utf8.encode(jsonString);

    // Convert bytes to a hex string
    return bytes.map((byte) => byte.toRadixString(16).padLeft(2, '0')).join();
  }

  factory GenerateResultInfo.fromHex(String hex) {
// Convert hex string to bytes
    Uint8List bytes = Uint8List.fromList(List<int>.generate(
      hex.length ~/ 2,
      (i) => int.parse(hex.substring(i * 2, i * 2 + 2), radix: 16),
    ));

    // Convert bytes to JSON string
    String jsonString = utf8.decode(bytes);

    // Deserialize JSON to GenerateResultInfo object
    return GenerateResultInfo.fromJson(jsonDecode(jsonString));
  }

  factory GenerateResultInfo.fromJson(dynamic json) =>
      _$GenerateResultInfoFromJson(json);
}
