import 'dart:html';

import 'package:flutter/material.dart';
import 'package:kg_kit/kg_kit.dart';
import 'package:kg_meet_tpe/domain/generate_result_info.dart';
import 'package:kg_meet_tpe/presentation/widgets/soul_image_view.dart';
import 'package:screenshot/screenshot.dart';

class SoulImageDownloadDialog extends StatefulWidget {
  final GenerateResultInfo info;

  const SoulImageDownloadDialog({super.key, required this.info});

  static void show(BuildContext context, GenerateResultInfo info) {
    showDialog(
        context: context,
        builder: (context) {
          return SoulImageDownloadDialog(info: info);
        });
  }

  @override
  State<StatefulWidget> createState() {
    return SoulImageDownloadDialogState();
  }
}

class SoulImageDownloadDialogState extends State<SoulImageDownloadDialog> {
  final screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Screenshot(
              controller: screenshotController,
              child: SoulImageView(info: widget.info, isPreview: false)),
          h24,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              KgButton(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24),
                  height: 48,
                  backgroundColor: Colors.white,
                  textStyle: context.themeExtension.bodyText1.copyWith(
                      color: context.colors.primary,
                      fontWeight: FontWeight.w600),
                  label: '關閉',
                  onTap: () async {
                    Navigator.pop(context);
                  }),
              w24,
              KgButton(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24),
                  height: 48,
                  backgroundColor: Colors.white,
                  textStyle: context.themeExtension.bodyText1.copyWith(
                      color: context.colors.primary,
                      fontWeight: FontWeight.w600),
                  label: '下載圖片',
                  onTap: () async {
                    final image = await screenshotController.capture();

                    if (image != null) {
                      final blob = Blob([image], 'image/png');

                      final url = Url.createObjectUrlFromBlob(blob);
                      final anchor = AnchorElement(href: url)
                        ..setAttribute("download", 'My wallet card.png')
                        ..click();

                      Url.revokeObjectUrl(url);
                    }
                  }),
            ],
          )
        ],
      ),
    );
  }
}
