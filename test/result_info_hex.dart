
import 'package:flutter_test/flutter_test.dart';
import 'package:kg_meet_tpe/domain/generate_result_info.dart';


void main() {
  test('Generate Result base64', () async {
    const resultInfo = GenerateResultInfo(
        name: 'Alice',
        birth: '1996-05-01',
        address: '0x4185ca9b59745f767469B6a3E0066188e5E5c5e4',
        privateKey: '123');
    final hex = resultInfo.encodedSoulInfo;
    final decodeResultInfo = GenerateResultInfo.fromEncodedSoulInfo(hex);
    expect(resultInfo.name, decodeResultInfo.name);
    expect(resultInfo.birth, decodeResultInfo.birth);
    expect(resultInfo.address, decodeResultInfo.address);
  });
}
