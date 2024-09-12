import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hoagsource/hoagsource.dart';

@immutable
class BaseTokenBorders extends ThemeExtension<BaseTokenBorders> with DiagnosticableTreeMixin {
  static const borders = BaseTokenBorders(
    interactiveXs: BorderRadius.all(Radius.circular(BaseSpacing.spacing1)),
    interactiveSm: BorderRadius.all(Radius.circular(BaseSpacing.spacing2)),
    interactiveMd: BorderRadius.all(Radius.circular(BaseSpacing.spacing3)),
    surfaceXs: BorderRadius.all(Radius.circular(BaseSpacing.spacing1)),
    surfaceSm: BorderRadius.all(Radius.circular(BaseSpacing.spacing2)),
    surfaceMd: BorderRadius.all(Radius.circular(BaseSpacing.spacing3)),
    surfaceLg: BorderRadius.all(Radius.circular(BaseSpacing.spacing4)),
    defaultBorderWidth: 1,
    activeBorderWidth: 1.5,
  );

  /// The extra small interactive radius.
  final BorderRadiusGeometry interactiveXs;

  /// The small interactive radius.
  final BorderRadiusGeometry interactiveSm;

  /// The medium interactive radius.
  final BorderRadiusGeometry interactiveMd;

  /// The extra small surface radius.
  final BorderRadiusGeometry surfaceXs;

  /// The small surface radius.
  final BorderRadiusGeometry surfaceSm;

  /// The medium surface radius.
  final BorderRadiusGeometry surfaceMd;

  /// The large surface radius.
  final BorderRadiusGeometry surfaceLg;

  /// The default border width.
  final double defaultBorderWidth;

  /// The active border width.
  final double activeBorderWidth;

  const BaseTokenBorders({
    required this.interactiveXs,
    required this.interactiveSm,
    required this.interactiveMd,
    required this.surfaceXs,
    required this.surfaceSm,
    required this.surfaceMd,
    required this.surfaceLg,
    required this.defaultBorderWidth,
    required this.activeBorderWidth,
  });

  @override
  BaseTokenBorders copyWith({
    BorderRadiusGeometry? interactiveXs,
    BorderRadiusGeometry? interactiveSm,
    BorderRadiusGeometry? interactiveMd,
    BorderRadiusGeometry? surfaceXs,
    BorderRadiusGeometry? surfaceSm,
    BorderRadiusGeometry? surfaceMd,
    BorderRadiusGeometry? surfaceLg,
    double? defaultBorderWidth,
    double? activeBorderWidth,
  }) {
    return BaseTokenBorders(
      interactiveXs: interactiveXs ?? this.interactiveXs,
      interactiveSm: interactiveSm ?? this.interactiveSm,
      interactiveMd: interactiveMd ?? this.interactiveMd,
      surfaceXs: surfaceXs ?? this.surfaceXs,
      surfaceSm: surfaceSm ?? this.surfaceSm,
      surfaceMd: surfaceMd ?? this.surfaceMd,
      surfaceLg: surfaceLg ?? this.surfaceLg,
      defaultBorderWidth: defaultBorderWidth ?? this.defaultBorderWidth,
      activeBorderWidth: activeBorderWidth ?? this.activeBorderWidth,
    );
  }

  @override
  BaseTokenBorders lerp(ThemeExtension<BaseTokenBorders>? other, double t) {
    if (other is! BaseTokenBorders) return this;

    return BaseTokenBorders(
      interactiveXs: BorderRadiusGeometry.lerp(interactiveXs, other.interactiveXs, t)!,
      interactiveSm: BorderRadiusGeometry.lerp(interactiveSm, other.interactiveSm, t)!,
      interactiveMd: BorderRadiusGeometry.lerp(interactiveMd, other.interactiveMd, t)!,
      surfaceXs: BorderRadiusGeometry.lerp(surfaceXs, other.surfaceXs, t)!,
      surfaceSm: BorderRadiusGeometry.lerp(surfaceSm, other.surfaceSm, t)!,
      surfaceMd: BorderRadiusGeometry.lerp(surfaceMd, other.surfaceMd, t)!,
      surfaceLg: BorderRadiusGeometry.lerp(surfaceLg, other.surfaceLg, t)!,
      defaultBorderWidth: lerpDouble(defaultBorderWidth, other.defaultBorderWidth, t)!,
      activeBorderWidth: lerpDouble(activeBorderWidth, other.activeBorderWidth, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "MoonBorders"))
      ..add(DiagnosticsProperty<BorderRadiusGeometry>("interactiveXs", interactiveXs))
      ..add(DiagnosticsProperty<BorderRadiusGeometry>("interactiveSm", interactiveSm))
      ..add(DiagnosticsProperty<BorderRadiusGeometry>("interactiveMd", interactiveMd))
      ..add(DiagnosticsProperty<BorderRadiusGeometry>("surfaceXs", surfaceXs))
      ..add(DiagnosticsProperty<BorderRadiusGeometry>("surfaceSm", surfaceSm))
      ..add(DiagnosticsProperty<BorderRadiusGeometry>("surfaceMd", surfaceMd))
      ..add(DiagnosticsProperty<BorderRadiusGeometry>("surfaceLg", surfaceLg))
      ..add(DoubleProperty("defaultBorderWidth", defaultBorderWidth))
      ..add(DoubleProperty("activeBorderWidth", activeBorderWidth));
  }
}
