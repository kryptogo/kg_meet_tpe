import 'package:freezed_annotation/freezed_annotation.dart';

part 'generate_result_info.freezed.dart';

part 'generate_result_info.g.dart';

@freezed
class GenerateResultInfo with _$GenerateResultInfo {
  const factory GenerateResultInfo({
    required String name,
    required String birth,
    required String address,
    required String privateKey,
  }) = _GenerateResultInfo;

  factory GenerateResultInfo.fromJson(dynamic json) =>
      _$GenerateResultInfoFromJson(json);
}
