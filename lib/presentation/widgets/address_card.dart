import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kg_kit/kg_kit.dart';
import 'package:kg_meet_tpe/domain/generate_result_info.dart';
import 'package:kg_meet_tpe/generated/assets.gen.dart';
import 'package:kg_tools/kg_tools.dart';

class AddressCard extends StatelessWidget {
  final GenerateResultInfo info;

  const AddressCard({super.key, required this.info});

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
                  Text(
                    '你的靈魂錢包',
                    style: context.themeExtension.bodyText2Contrast,
                  ),
                  h8,
                  Text(
                    info.address.toFormattedAddress(),
                    style: context.themeExtension.headline1
                        .copyWith(color: context.themeExtension.secondary),
                  ),
                  h8,
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          info.address,
                          style: context.themeExtension.bodyText2Contrast,
                        ),
                      ),
                      w8,
                      InkWell(
                          onTap: () async {
                            Clipboard.setData(
                                ClipboardData(text: info.address));
                            showToast('複製成功');
                          },
                          child: Assets.iconCopy.svg(width: 16, height: 16))
                    ],
                  ),
                  h24,
                  Row(
                    children: [
                      if (info.privateKey != null) ...[
                        KgButton(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 14),
                            textStyle: context.themeExtension.bodyText1Contrast
                                .copyWith(fontWeight: FontWeight.w600),
                            label: '複製私鑰',
                            onTap: () async {
                              Clipboard.setData(
                                  ClipboardData(text: info.privateKey!));
                              showToast('複製成功');
                            }),
                        w24,
                      ],
                      KgButton(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 14),
                          backgroundColor: Colors.white,
                          textStyle: context.themeExtension.bodyText1.copyWith(
                              color: context.colors.primary,
                              fontWeight: FontWeight.w600),
                          label: '下載/開啟 KryotoGO錢包',
                          onTap: () async {
                            window.open('https://kryptogo.page.link/wallet-tw',
                                'KryptoGO - Wallet App');
                          }),
                    ],
                  )
                ],
              ),
            ),
            if (info.privateKey != null) ...[
              w24,
              InkWell(
                onTap: () {
                  //todo alice show private key
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
          ],
        ));
  }
}
