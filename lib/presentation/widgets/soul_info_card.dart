import 'dart:html';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kg_kit/kg_kit.dart';
import 'package:kg_meet_tpe/domain/generate_result_info.dart';
import 'package:kg_meet_tpe/presentation/dialog/dialog_soul_image_download.dart';
import 'package:kg_meet_tpe/presentation/widgets/base_card.dart';
import 'package:kg_meet_tpe/presentation/widgets/soul_image_view.dart';

class SoulInfoCard extends StatelessWidget {
  final GenerateResultInfo info;

  const SoulInfoCard({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  _SoulTag(
                    title: '靈魂數字',
                    content: info.soulInfo.soulNumber.toString(),
                  ),
                  context.isMobile ? w12 : w24,
                  const SlashDivider(),
                  context.isMobile ? w12 : w24,
                  _SoulTag(title: '靈魂色彩', content: info.soulInfo.soulColor),
                  context.isMobile ? w12 : w24,
                  const SlashDivider(),
                  context.isMobile ? w12 : w24,
                  _SoulTag(title: '靈魂水晶', content: info.soulInfo.crystal),
                ],
              ),
              h24,
              Text(
                '特質',
                style: context.themeExtension.bodyText2Contrast,
              ),
              h8,
              Text(
                info.soulInfo.keyword,
                style: context.themeExtension.headline1
                    .copyWith(color: context.themeExtension.secondary),
              ),
              h8,
              Text(
                info.soulInfo.soulCharacter,
                style: context.themeExtension.bodyText2Contrast,
              ),
              if (context.isMobile) ...[
                h24,
                SoulImageView(info: info, isPreview: true),
              ],
              h24,
              Wrap(
                spacing: 24,
                runSpacing: 16,
                children: [
                  KgButton(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 14),
                      backgroundColor: Colors.white,
                      textStyle: context.themeExtension.bodyText1.copyWith(
                          color: context.colors.primary,
                          fontWeight: FontWeight.w600),
                      label: '下載圖片',
                      onTap: () async {
                        SoulImageDownloadDialog.show(context, info);
                      }),
                  KgButton(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 14),
                      textStyle: context.themeExtension.bodyText1Contrast
                          .copyWith(fontWeight: FontWeight.w600),
                      label: '隱藏私鑰分享我的結果',
                      onTap: () async {
                        Clipboard.setData(
                            ClipboardData(text: window.location.href));
                        showToast('複製成功');
                      }),
                  KgButton(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 14),
                      textStyle: context.themeExtension.bodyText1.copyWith(
                          color: context.colors.primary,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                      width: context.isMobile ? double.infinity : null,
                      type: KgButtonType.outline,
                      label: '邀請朋友尋找靈魂錢包',
                      onTap: () async {
                        Clipboard.setData(const ClipboardData(
                            text: 'https://soul-wallet.kryptogo.com'));
                        showToast('複製成功');
                      })
                ],
              ),
            ],
          ),
        ),
        if (!context.isMobile) ...[
          w24,
          SoulImageView(info: info, isPreview: true),
        ]
      ],
    );
  }
}

class _SoulTag extends StatelessWidget {
  final String content;
  final String title;

  const _SoulTag({required this.content, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.themeExtension.bodyText2Contrast,
        ),
        h8,
        AutoSizeText(
          content,
          maxLines: 1,
          minFontSize: 5,
          style: context.themeExtension.headline1
              .copyWith(color: context.themeExtension.secondary),
        ),
      ],
    );
  }
}

class SlashDivider extends StatelessWidget {
  final double height;
  final Color color;
  final double thickness;

  const SlashDivider({
    Key? key,
    this.height = 58.0,
    this.color = Colors.white,
    this.thickness = 1.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: pi / 12, // 15 degrees
      child: Container(
        height: height,
        color: color,
        width: thickness,
      ),
    );
  }
}
