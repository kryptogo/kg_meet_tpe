import 'package:flutter/material.dart';
import 'package:kg_meet_tpe/domain/generate_result_info.dart';

class GenerateResultScreen extends StatefulWidget {
  const GenerateResultScreen({super.key});

  @override
  State<GenerateResultScreen> createState() => _GenerateResultScreenState();
}

class _GenerateResultScreenState extends State<GenerateResultScreen> {
  final fakeInfo = const GenerateResultInfo(
      name: 'Alice',
      birthday: '05/01',
      address: '0xdsdsdsdd',
      privateKey: '1223');

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Row(
      children: [
        ResultInfoView(info: fakeInfo)
      ],
    ));
  }
}


class ResultInfoView extends StatelessWidget {
  const ResultInfoView({
    Key? key,
    required this.info,
  }) : super(key: key);

  final GenerateResultInfo info;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(info.name),
          Text(info.birthday),
          Text(info.address),
          Text(info.privateKey),
        ],
      )
    );
  }
}
