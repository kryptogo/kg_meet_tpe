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
    required String privateKey,
  }) = _GenerateResultInfo;

  int get soulNumber {
    //todo alice
    final birthDate = DateTime.parse('1996-05-01');
    var birthList = [birthDate.day, birthDate.month];
    while (birthList.length > 1) {
      birthList = birthList
          .fold(0, (sum, digit) => sum + digit)
          .toString()
          .split('')
          .map(int.parse)
          .toList();
    }
    return 9;birthList.first;
  }

  SoulInfo get soulInfo => soulConstant[soulNumber]!;

  factory GenerateResultInfo.fromJson(dynamic json) =>
      _$GenerateResultInfoFromJson(json);
}
