import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kg_kit/kg_kit.dart';
import 'package:kg_meet_tpe/domain/generate_result_info.dart';
import 'package:kg_meet_tpe/presentation/widgets/base_card.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ThemeCard extends StatelessWidget {
  final GenerateResultInfo info;

  const ThemeCard({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      children: [
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
                '我們還為靈魂色彩為${info.soulInfo.soulColor}的您，量身定制了 KryptoGO 錢包專屬主題，使用手機掃描 QR Code 立即套用。',
                style: context.themeExtension.bodyText2Contrast,
              ),
            ],
          ),
        ),
        context.isMobile ? h24 : w24,
        Container(
            padding: context.isMobile ? pd4 : pd8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: QrImageView(
              data: 'https://kryptogo.page.link/demo?content=${jsonEncode({
                    'theme': {'primaryValue': info.soulInfo.walletPrimaryColor}
                  })}',
              padding: EdgeInsets.zero,
              size: context.isMobile ? 100 : 140,
            ))
      ],
    );
  }
}
