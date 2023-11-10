import 'package:flutter/material.dart';
import 'package:kg_meet_tpe/domain/generate_result_info.dart';

class GenerateResultScreen extends StatefulWidget {
  const GenerateResultScreen({super.key, required this.resultInfo});

  final GenerateResultInfo resultInfo;

  @override
  State<GenerateResultScreen> createState() => _GenerateResultScreenState();
}

class _GenerateResultScreenState extends State<GenerateResultScreen> {

  @override
  Widget build(BuildContext context) {
    return Material(
      color:Colors.green,
      child: Scaffold(body: Row(
        children: [
          ResultInfoView(info: widget.resultInfo)
        ],
      )),
    );
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
          Text(info.birth),
          Text(info.address),
          Text(info.privateKey),
        ],
      )
    );
  }
}
