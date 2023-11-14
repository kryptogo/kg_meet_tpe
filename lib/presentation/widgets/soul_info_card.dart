import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kg_kit/kg_kit.dart';
import 'package:kg_meet_tpe/domain/generate_result_info.dart';
import 'package:kg_meet_tpe/presentation/widgets/dialog_soul_image_download.dart';
import 'package:kg_meet_tpe/presentation/widgets/soul_image_view.dart';

class SoulInfoCard extends StatelessWidget {
  final GenerateResultInfo info;

  const SoulInfoCard({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return KgCard(
        color: Colors.transparent,
        borderColor: context.themeExtension.secondary,
        padding: pd24,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _SoulTag(
                        title: '靈魂數字',
                        content: info.soulInfo.soulNumber.toString()),
                    w24,
                    const SlashDivider(),
                    w24,
                    _SoulTag(title: '靈魂色彩', content: info.soulInfo.soulColor),
                    w24,
                    const SlashDivider(),
                    w24,
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
                h24,
                KgButton(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 14),
                    backgroundColor: Colors.white,
                    textStyle: context.themeExtension.bodyText1.copyWith(
                        color: context.colors.primary,
                        fontWeight: FontWeight.w600),
                    label: '下載圖片',
                    onTap: () async {
                      //todo alice
                      SoulImageDownloadDialog.show(context, info);
                    }),
              ],
            )),
            w24,
            SoulImageView(info: info, isPreview: true),
          ],
        ));
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
        Text(
          content,
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
