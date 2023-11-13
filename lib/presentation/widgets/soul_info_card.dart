import 'package:flutter/material.dart';
import 'package:kg_kit/kg_kit.dart';
import 'package:kg_meet_tpe/domain/generate_result_info.dart';
import 'package:kg_meet_tpe/generated/assets.gen.dart';

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
                    //todo alice divider
                    w24,
                    _SoulTag(
                        title: '靈魂色彩',
                        content: info.soulInfo.soulColor),
                    w24,
                    //todo alice divider
                    w24,
                    _SoulTag(
                        title: '靈魂水晶',
                        content: info.soulInfo.crystal),
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
                    }),
              ],
            )),
            w24,
            info.soulInfo.assetImage.image(
                width: 140,
                height: 252,
                fit: BoxFit.cover),
          ],
        ));
  }
}

class _SoulTag extends StatelessWidget {
  final String content;
  final String title;

  const _SoulTag({super.key, required this.content, required this.title});

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
