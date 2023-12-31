import 'dart:html';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kg_kit/kg_kit.dart';
import 'package:kg_meet_tpe/domain/generate_result_info.dart';
import 'package:kg_meet_tpe/generated/assets.gen.dart';
import 'package:kg_meet_tpe/presentation/dialog/dialog_pk_qrcode.dart';
import 'package:kg_meet_tpe/presentation/widgets/base_card.dart';

class AddressCard extends StatelessWidget {
  final GenerateResultInfo info;

  const AddressCard({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return BaseCard(children: [
      Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '你的靈魂錢包',
              style: context.themeExtension.bodyText2Contrast,
            ),
            h8,
            Row(
              children: [
                Text(
                  info.formattedAddress
                      .substring(0, info.formattedAddress.length - 4),
                  style: context.themeExtension.headline1
                      .copyWith(color: context.themeExtension.secondary),
                ),
                AnimatedTextKit(animatedTexts: [
                  WavyAnimatedText(
                      info.formattedAddress.substring(
                          info.formattedAddress.length - 4,
                          info.formattedAddress.length),
                      textStyle: context.themeExtension.headline1
                          .copyWith(color: context.themeExtension.secondary)),
                ], isRepeatingAnimation: true, repeatForever: true),
              ],
            ),
            h8,
            Row(
              children: [
                Flexible(
                  child: Text.rich(TextSpan(
                      text: '完整地址\n${info.address}',
                      style: context.themeExtension.bodyText2Contrast,
                      children: [
                        const WidgetSpan(child: w8),
                        WidgetSpan(
                            child: InkWell(
                                onTap: () async {
                                  Clipboard.setData(
                                      ClipboardData(text: info.address));
                                  showToast('複製成功');
                                },
                                child:
                                    Assets.iconCopy.svg(width: 16, height: 16)))
                      ])),
                ),
              ],
            ),
            h24,
            Wrap(
              spacing: 24,
              runSpacing: 16,
              children: [
                if (info.privateKey != null) ...[
                  KgButton(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      textStyle: context.themeExtension.bodyText1Contrast
                          .copyWith(fontWeight: FontWeight.w600),
                      label: '複製私鑰',
                      onTap: () async {
                        Clipboard.setData(
                            ClipboardData(text: info.privateKey!));
                        showToast('複製成功');
                      }),
                ],
                if (context.isMobile && info.privateKey != null)
                  KgButton(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    type: KgButtonType.primary,
                    backgroundColor: Colors.white,
                    textStyle: context.themeExtension.bodyText1.copyWith(
                        color: context.colors.primary,
                        fontWeight: FontWeight.w600),
                    prefixIcon: Assets.iconLock.svg(
                        width: 24,
                        height: 24,
                        color: context.themeExtension.primary),
                    label: '顯示私鑰 QRcode',
                    onTap: () async {
                      PrivateKeyDialog.show(context, info);
                    },
                  ),
                KgButton(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  backgroundColor: context.isMobile ? null : Colors.white,
                  type: context.isMobile
                      ? KgButtonType.outline
                      : KgButtonType.primary,
                  width: context.isMobile ? double.infinity : null,
                  textStyle: context.themeExtension.bodyText1.copyWith(
                      color: context.colors.primary,
                      fontWeight: FontWeight.w600),
                  label: '下載/開啟 KryotoGO錢包',
                  onTap: () async {
                    window.open('https://kryptogo.page.link/wallet-tw',
                        'KryptoGO - Wallet App');
                  },
                ),
              ],
            )
          ],
        ),
      ),
      if (info.privateKey != null && !context.isMobile) ...[
        w24,
        InkWell(
          onTap: () {
            PrivateKeyDialog.show(context, info);
          },
          child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 26,
              ),
              width: 140,
              height: 140,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: context.themeExtension.primary,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Assets.iconLock.svg(width: 24, height: 24),
                  h4,
                  Text(
                    '顯示私鑰\nQRcode',
                    textAlign: TextAlign.center,
                    style: context.themeExtension.bodyText2BoldContrast,
                  ),
                ],
              )),
        )
      ]
    ]);
  }
}
