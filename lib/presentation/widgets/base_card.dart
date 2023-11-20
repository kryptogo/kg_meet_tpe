import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kg_kit/kg_kit.dart';
import 'package:kg_meet_tpe/presentation/generate_result_screen.dart';

extension BuildContextExt on BuildContext {
  bool get isMobile => ResultScreenScope.of(this)?.isMobile ?? false;
}

class BaseCard extends StatelessWidget {
  final List<Widget> children;

  const BaseCard({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return KgCard(
        color: Colors.transparent,
        borderColor: context.themeExtension.secondary,
        padding: pd24,
        child: context.isMobile
            ? Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: children,
              ));
  }
}
