import 'package:flutter/material.dart';
import 'package:kg_kit/kg_kit.dart';
import 'package:kg_meet_tpe/domain/generate_result_info.dart';
import 'package:kg_meet_tpe/generated/assets.gen.dart';
import 'package:kg_tools/kg_tools.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';

class SoulImageView extends StatelessWidget {
  final GenerateResultInfo info;
  final bool isPreview;

  const SoulImageView({super.key, required this.info, required this.isPreview});

  @override
  Widget build(BuildContext context) {
    final height = (isPreview ? 248 : context.height * 0.75).toDouble();
    final width = (isPreview ? 140 : height * 9 / 16).toDouble();
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(isPreview ? 4 : 0),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.24),
              spreadRadius: 4,
              blurRadius: 48,
              offset: const Offset(4, 16),
            )
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(isPreview ? 4 : 0),
        child: Stack(
          children: [
            info.soulInfo.assetImage
                .image(width: width, height: height, fit: BoxFit.cover),
            Positioned.fill(
                top: 0,
                left: 0,
                child: SizedBox(
                    width: width,
                    child: _ImageHeader(
                      info: info,
                      isPreview: isPreview,
                    ))),
            Positioned.fill(
                bottom: 0,
                left: 0,
                child: SizedBox(
                    width: width,
                    child: _ImageFooter(info: info, isPreview: isPreview)))
          ],
        ),
      ),
    );
  }
}

class _ImageHeader extends StatelessWidget {
  final GenerateResultInfo info;

  const _ImageHeader({required this.info, this.isPreview = false});

  final bool isPreview;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(isPreview ? 6 : 14),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          context.themeExtension.primary.withOpacity(0.5),
          Colors.transparent,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Assets.logo.svg(height: isPreview ? 6 : 14, fit: BoxFit.fitHeight),
          Expanded(
            child: Container(
              alignment: Alignment.topRight,
              child: AutoSizeText('生成你的Web3靈魂錢包 >> ',
                  maxLines: 1,
                  minFontSize: isPreview ? 2 : 5,
                  style: context.themeExtension.bodyText1Contrast
                      .copyWith(fontSize: isPreview ? 5 : 12)),
            ),
          ),
          Container(
              color: Colors.white,
              padding: const EdgeInsets.all(2),
              child: QrImageView(
                padding: EdgeInsets.zero,
                data: 'https://soul-wallet.kryptogo.com',
                size: isPreview ? 24 : 36,
              ))
        ],
      ),
    );
  }
}

class _ImageFooter extends StatelessWidget {
  final GenerateResultInfo info;
  final bool isPreview;

  const _ImageFooter({required this.info, this.isPreview = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(isPreview ? 6 : 14),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.transparent,
          context.themeExtension.primary.withOpacity(0.5)
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text.rich(TextSpan(
                    text: info.name,
                    style: context.themeExtension.bodyText1BoldContrast
                        .copyWith(fontSize: isPreview ? 13 : 30),
                    children: [
                      TextSpan(
                          text: '  的靈魂錢包',
                          style: context.themeExtension.bodyText1BoldContrast
                              .copyWith(fontSize: isPreview ? 5 : 12))
                    ])),
                const SizedBox(height: 2),
                AutoSizeText(info.formattedAddress,
                    minFontSize: isPreview ? 3 : 12,
                    maxLines: 1,
                    style: context.themeExtension.bodyText1Bold.copyWith(
                        color: context.themeExtension.secondary,
                        fontSize: isPreview ? 13 : 30)),
                const SizedBox(height: 2),
                Text(info.address,
                    style: context.themeExtension.bodyText2Contrast
                        .copyWith(fontSize: isPreview ? 5 : 9)),
              ],
            ),
          ),
          w4,
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('掃描轉帳給我',
                  style: context.themeExtension.bodyText1Contrast
                      .copyWith(fontSize: isPreview ? 4 : 9)),
              Assets.iconArrow
                  .svg(width: isPreview ? 4 : 9, height: isPreview ? 2 : 4.5),
              h4,
              Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(isPreview ? 4 : 2),
                  child: QrImageView(
                    padding: EdgeInsets.zero,
                    data: info.address,
                    size: isPreview ? 24 : 56,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
