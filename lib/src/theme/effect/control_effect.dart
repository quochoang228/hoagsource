import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hoagsource/hoagsource.dart';

@immutable
class BaseControlEffect extends ThemeExtension<BaseControlEffect> with DiagnosticableTreeMixin {
  /// The effect color of the control.
  final Color? effectColor;

  /// The effect duration of the control.
  final Duration effectDuration;

  /// The effect curve of the control.
  final Curve effectCurve;

  /// The effect extent of the control.
  final double? effectExtent;

  /// The effect scalar of the control.
  final double? effectScalar;

  const BaseControlEffect({
    this.effectColor,
    required this.effectDuration,
    required this.effectCurve,
    this.effectExtent,
    this.effectScalar,
  });

  @override
  BaseControlEffect copyWith({
    Color? effectColor,
    Duration? effectDuration,
    Curve? effectCurve,
    double? effectExtent,
    double? effectScalar,
  }) {
    return BaseControlEffect(
      effectColor: effectColor ?? this.effectColor,
      effectDuration: effectDuration ?? this.effectDuration,
      effectCurve: effectCurve ?? this.effectCurve,
      effectExtent: effectExtent ?? this.effectExtent,
      effectScalar: effectScalar ?? this.effectScalar,
    );
  }

  @override
  BaseControlEffect lerp(ThemeExtension<BaseControlEffect>? other, double t) {
    if (other is! BaseControlEffect) return this;

    return BaseControlEffect(
      effectColor: colorPremulLerp(effectColor, other.effectColor, t),
      effectDuration: lerpDuration(effectDuration, other.effectDuration, t),
      effectCurve: other.effectCurve,
      effectExtent: lerpDouble(effectExtent, other.effectExtent, t),
      effectScalar: lerpDouble(effectScalar, other.effectScalar, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "MoonControlsEffects"))
      ..add(ColorProperty("effectColor", effectColor))
      ..add(DiagnosticsProperty<Duration>("effectDuration", effectDuration))
      ..add(DiagnosticsProperty<Curve>("effectCurve", effectCurve))
      ..add(DoubleProperty("effectExtent", effectExtent))
      ..add(DoubleProperty("effectScalar", effectScalar));
  }
}
