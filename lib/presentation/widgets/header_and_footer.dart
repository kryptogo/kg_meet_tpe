import 'dart:html';

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:kg_kit/kg_kit.dart';
import 'package:kg_meet_tpe/generated/assets.gen.dart';
import 'package:kg_meet_tpe/presentation/widgets/base_card.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: Row(
        children: [
          BackButton(),
          w24,
          Expanded(
              child: AutoSizeText(
            '靈魂錢包生成器',
            style: context.isMobile
                ? context.themeExtension.bodyText2BoldContrast
                : context.themeExtension.headline3Contrast,
            maxLines: 1,
          )),
          Assets.logo
              .svg(height: context.isMobile ? 16 : 24, fit: BoxFit.fitHeight)
        ],
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: Row(
        children: [
          BackButton(),
          const Spacer(),
          InkWell(
            onTap: () {
              window.open('https://www.kryptogo.com/tw/products/wallet',
                  "KryptoGO - Wallet App");
            },
            child: Text('認識KryptoGO Wallet',
                style: context.themeExtension.headline3Contrast
                    .copyWith(decoration: TextDecoration.underline)),
          ),
        ],
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Row(
        children: [
          Assets.iconBack.svg(),
          const SizedBox(width: 2),
          Text('Back', style: context.themeExtension.bodyText1Disabled)
        ],
      ),
    );
  }
}
