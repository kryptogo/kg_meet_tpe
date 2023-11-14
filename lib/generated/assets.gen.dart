/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class Assets {
  Assets._();

  /// File path: assets/google_download_button.png
  static const AssetGenImage googleDownloadButton =
      AssetGenImage('assets/google_download_button.png');

  /// File path: assets/icon_arrow.svg
  static const SvgGenImage iconArrow = SvgGenImage('assets/icon_arrow.svg');

  /// File path: assets/icon_back.svg
  static const SvgGenImage iconBack = SvgGenImage('assets/icon_back.svg');

  /// File path: assets/icon_copy.svg
  static const SvgGenImage iconCopy = SvgGenImage('assets/icon_copy.svg');

  /// File path: assets/icon_lock.svg
  static const SvgGenImage iconLock = SvgGenImage('assets/icon_lock.svg');

  /// File path: assets/ios_download_button.png
  static const AssetGenImage iosDownloadButton =
      AssetGenImage('assets/ios_download_button.png');

  /// File path: assets/logo.svg
  static const SvgGenImage logo = SvgGenImage('assets/logo.svg');

  /// File path: assets/soul_1.png
  static const AssetGenImage soul1 = AssetGenImage('assets/soul_1.png');

  /// File path: assets/soul_2.png
  static const AssetGenImage soul2 = AssetGenImage('assets/soul_2.png');

  /// File path: assets/soul_3.png
  static const AssetGenImage soul3 = AssetGenImage('assets/soul_3.png');

  /// File path: assets/soul_4.png
  static const AssetGenImage soul4 = AssetGenImage('assets/soul_4.png');

  /// File path: assets/soul_5.png
  static const AssetGenImage soul5 = AssetGenImage('assets/soul_5.png');

  /// File path: assets/soul_6.png
  static const AssetGenImage soul6 = AssetGenImage('assets/soul_6.png');

  /// File path: assets/soul_7.png
  static const AssetGenImage soul7 = AssetGenImage('assets/soul_7.png');

  /// File path: assets/soul_8.png
  static const AssetGenImage soul8 = AssetGenImage('assets/soul_8.png');

  /// File path: assets/soul_9.png
  static const AssetGenImage soul9 = AssetGenImage('assets/soul_9.png');

  /// List of all assets
  List<dynamic> get values => [
        googleDownloadButton,
        iconArrow,
        iconBack,
        iconCopy,
        iconLock,
        iosDownloadButton,
        logo,
        soul1,
        soul2,
        soul3,
        soul4,
        soul5,
        soul6,
        soul7,
        soul8,
        soul9
      ];
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
