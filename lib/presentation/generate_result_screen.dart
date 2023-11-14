import 'dart:html';

import 'package:flutter/material.dart';
import 'package:kg_kit/kg_kit.dart';
import 'package:kg_meet_tpe/domain/generate_result_info.dart';
import 'package:kg_meet_tpe/generated/assets.gen.dart';
import 'package:kg_meet_tpe/presentation/widgets/address_card.dart';
import 'package:kg_meet_tpe/presentation/widgets/header_and_footer.dart';
import 'package:kg_meet_tpe/presentation/widgets/soul_info_card.dart';
import 'package:kg_meet_tpe/presentation/widgets/theme_card.dart';
import 'package:kg_tools/kg_tools.dart';

class GenerateResultScreen extends StatefulWidget {
  const GenerateResultScreen({super.key, required this.resultInfo});

  final GenerateResultInfo resultInfo;

  @override
  State<GenerateResultScreen> createState() => _GenerateResultScreenState();
}

class _GenerateResultScreenState extends State<GenerateResultScreen> {
  @override
  void initState() {
    super.initState();
    afterRender(() {
      KgKit.of(context).setThemeData(KgKit.of(context).themeData.copyWith(
          backgroundPrimaryValue: widget.resultInfo.soulInfo.backgroundColor,
          primaryValue: widget.resultInfo.soulInfo.buttonColor,
          secondaryValue: widget.resultInfo.soulInfo.outlineColor));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.themeExtension.backgroundPrimary,
        body: Row(
          children: [
            widget.resultInfo.soulInfo.assetImage
                .image(width: context.width / 3, fit: BoxFit.cover),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width * 0.06),
              child: ResultInfoView(info: widget.resultInfo),
            ))
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
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Header(),
              h32,
              h8,
              Text(
                info.name,
                style: context.themeExtension.headline1
                    .copyWith(color: context.themeExtension.secondary),
              ),
              h8,
              Text(
                info.birth,
                style: context.themeExtension.bodyText2Contrast,
              ),
              h24,
              AddressCard(info: info),
              h24,
              SoulInfoCard(info: info),
              h24,
              ThemeCard(info: info),
              h24,
              Text(
                '特質為${info.soulInfo.keyword}的${info.name}，適合使用保障你資產和交易安全的 KryptoGO 錢包',
                style: context.themeExtension.headline1
                    .copyWith(color: context.themeExtension.secondary),
              ),
              h24,
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        window.open(
                            'https://apps.apple.com/app/kryptogo/id1593830910',
                            "KryptoGO - Wallet App");
                      },
                      child: Assets.iosDownloadButton
                          .image(width: 156, height: 48)),
                  w24,
                  InkWell(
                      onTap: () {
                        window.open(
                            'https://play.google.com/store/apps/details?id=com.kryptogo.walletapp',
                            "KryptoGO - Wallet App");
                      },
                      child: Assets.googleDownloadButton
                          .image(width: 156, height: 48))
                ],
              ),
              h32,
              h8,
              const Footer()
            ],
          ),
        ));
  }
}
