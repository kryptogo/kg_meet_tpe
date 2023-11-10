import 'package:freezed_annotation/freezed_annotation.dart';

part 'generate_result_info.freezed.dart';

@freezed
class GenerateResultInfo with _$GenerateResultInfo {
  const factory GenerateResultInfo({
    required String name,
    required String birthday,
    required String address,
    required String privateKey,
  }) = _GenerateResultInfo;

}