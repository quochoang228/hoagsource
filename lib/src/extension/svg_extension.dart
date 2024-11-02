import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgSize {
  final double width;
  final double height;

  const SvgSize(this.width, this.height);

  static const SvgSize small = SvgSize(16, 16);
  static const SvgSize medium = SvgSize(24, 24);
  static const SvgSize large = SvgSize(32, 32);
}

extension SvgExt on SvgPicture {
  Future<void> precache() async {
    await svg.cache.putIfAbsent(
      bytesLoader.cacheKey(null),
      () => bytesLoader.loadBytes(null),
    );
  }

  SvgPicture resize(SvgSize size) {
    return SvgPicture(
      bytesLoader,
      width: size.width,
      height: size.height,
    )._apply();
  }

  SvgPicture withColor(
    Color color, {
    BlendMode? blendMode,
  }) {
    return SvgPicture(
      bytesLoader,
      colorFilter: ColorFilter.mode(color, blendMode ?? BlendMode.srcIn),
    )._apply();
  }

  SvgPicture _apply() {
    return SvgPicture(
      bytesLoader,
      key: key,
      width: width,
      height: height,
      colorFilter: colorFilter,
      alignment: alignment,
      fit: fit,
      matchTextDirection: matchTextDirection,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      excludeFromSemantics: excludeFromSemantics,
      semanticsLabel: semanticsLabel,
      clipBehavior: clipBehavior,
    );
  }
}
