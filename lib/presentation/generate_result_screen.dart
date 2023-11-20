import 'dart:html';

import 'package:flutter/material.dart';
import 'package:kg_kit/kg_kit.dart';
import 'package:kg_meet_tpe/domain/generate_result_info.dart';
import 'package:kg_meet_tpe/generated/assets.gen.dart';
import 'package:kg_meet_tpe/presentation/widgets/address_card.dart';
import 'package:kg_meet_tpe/presentation/widgets/base_card.dart';
import 'package:kg_meet_tpe/presentation/widgets/header_and_footer.dart';
import 'package:kg_meet_tpe/presentation/widgets/soul_info_card.dart';
import 'package:kg_meet_tpe/presentation/widgets/theme_card.dart';
import 'package:kg_tools/kg_tools.dart';

class ResultScreenScope extends InheritedWidget {
  final bool isMobile;
  final bool isTablet;
  final GenerateResultInfo resultInfo;

  const ResultScreenScope(
      {super.key,
      required super.child,
      required this.isTablet,
      required this.isMobile,
      required this.resultInfo});

  static ResultScreenScope? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ResultScreenScope>();
  }

  @override
  bool updateShouldNotify(covariant ResultScreenScope oldWidget) {
    return oldWidget.isMobile != isMobile ||
        oldWidget.isTablet != isTablet ||
        oldWidget.resultInfo != resultInfo;
  }
}

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
    bool isTablet = context.width <= 1024 && context.width >= 450;
    bool isMobile = context.width < 450;
    return ResultScreenScope(
        isMobile: isMobile,
        isTablet: isTablet,
        resultInfo: widget.resultInfo,
        child: Scaffold(
            backgroundColor: context.themeExtension.backgroundPrimary,
            body: isMobile || isTablet
                ? Stack(
                    children: [
                      Opacity(
                        opacity: 0.2,
                        child: widget.resultInfo.soulInfo.assetImage
                            .image(width: context.width, fit: BoxFit.cover),
                      ),
                      ResultInfoView(info: widget.resultInfo)
                    ],
                  )
                : Row(
                    children: [
                      widget.resultInfo.soulInfo.assetImage.image(
                          width: context.width / 3,
                          height: context.height,
                          fit: BoxFit.cover),
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: context.width * 0.06),
                        child: ResultInfoView(info: widget.resultInfo),
                      ))
                    ],
                  )));
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
        padding: EdgeInsets.symmetric(horizontal: context.isMobile ? 16 : 40),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: context.isMobile
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                const Header(),
                if (context.isMobile) h16 else ...[h32, h8],
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
                  '特質為${info.soulInfo.keyword}的 ${info.name}，適合使用保障你資產和交易安全的 KryptoGO 錢包',
                  style: (context.isMobile
                          ? context.themeExtension.bodyText1Bold
                          : context.themeExtension.headline1)
                      .copyWith(color: context.themeExtension.secondary),
                ),
                h24,
                Row(
                  children: [
                    Flexible(
                      child: InkWell(
                          onTap: () {
                            window.open(
                                'https://apps.apple.com/app/kryptogo/id1593830910',
                                "KryptoGO - Wallet App");
                          },
                          child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                  maxWidth: 156, maxHeight: 48),
                              child: Assets.iosDownloadButton
                                  .image(fit: BoxFit.fitWidth))),
                    ),
                    w24,
                    Flexible(
                      child: InkWell(
                          onTap: () {
                            window.open(
                                'https://play.google.com/store/apps/details?id=com.kryptogo.walletapp',
                                "KryptoGO - Wallet App");
                          },
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                                maxWidth: 156, maxHeight: 48),
                            child: Assets.googleDownloadButton
                                .image(fit: BoxFit.fitWidth),
                          )),
                    )
                  ],
                ),
                h32,
                h8,
                const Footer()
              ],
            ),
          ),
        ));
  }
}
