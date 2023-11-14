import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kg_kit/kg_kit.dart';
import 'package:kg_meet_tpe/domain/generate_result_info.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PrivateKeyDialog extends StatelessWidget {
  final GenerateResultInfo info;

  const PrivateKeyDialog({super.key, required this.info});

  static void show(BuildContext context, GenerateResultInfo info) {
    showDialog(
        context: context,
        builder: (context) {
          return PrivateKeyDialog(info: info);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: pd8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: QrImageView(
          padding: EdgeInsets.zero,
          data: info.privateKey ?? '',
          size: 280,
        ),
      ),
    );
  }
}
