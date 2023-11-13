import 'package:flutter/material.dart';
import 'package:kg_kit/kg_kit.dart';
import 'package:kg_meet_tpe/domain/generate_result_info.dart';

class ThemeCard extends StatelessWidget {
  final GenerateResultInfo info;

  const ThemeCard({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return KgCard(
        color: Colors.transparent,
        borderColor: context.themeExtension.secondary,
        padding: pd24,
        child: Row(children: [
          Flexible(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(
                  '主題',
                  style: context.themeExtension.bodyText2Contrast,
                ),
                h8,
                Text(
                  'KryptoGO 錢包專屬主題',
                  style: context.themeExtension.headline1
                      .copyWith(color: context.themeExtension.secondary),
                ),
                h8,
                Text(
                  '我們還為靈魂色彩為綠色的您，量身定制了 KryptoGO 錢包專屬主題，使用手機掃描 QR Code 立即套用。',
                  style: context.themeExtension.bodyText2Contrast,
                ),
              ])),
          w24,
          //todo alice themeQRcode
        ]));
  }
}