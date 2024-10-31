import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hoagsource/hoagsource.dart';

@immutable
class BaseTokenFocusEffect extends ThemeExtension<BaseTokenFocusEffect> with DiagnosticableTreeMixin {
  /// The color of the focus effect.
  final Color effectColor;

  /// The extent of the focus effect.
  final double effectExtent;

  /// The duration of the focus effect.
  final Duration effectDuration;

  /// The curve of the focus effect.
  final Curve effectCurve;

  const BaseTokenFocusEffect({
    required this.effectColor,
    required this.effectExtent,
    required this.effectDuration,
    required this.effectCurve,
  });

  @override
  BaseTokenFocusEffect copyWith({
    Color? effectColor,
    double? effectExtent,
    Duration? effectDuration,
    Curve? effectCurve,
  }) {
    return BaseTokenFocusEffect(
      effectColor: effectColor ?? this.effectColor,
      effectExtent: effectExtent ?? this.effectExtent,
      effectDuration: effectDuration ?? this.effectDuration,
      effectCurve: effectCurve ?? this.effectCurve,
    );
  }

  @override
  BaseTokenFocusEffect lerp(ThemeExtension<BaseTokenFocusEffect>? other, double t) {
    if (other is! BaseTokenFocusEffect) return this;

    return BaseTokenFocusEffect(
      effectColor: colorPremulLerp(effectColor, other.effectColor, t)!,
      effectExtent: lerpDouble(effectExtent, other.effectExtent, t)!,
      effectDuration: lerpDuration(effectDuration, other.effectDuration, t),
      effectCurve: other.effectCurve,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "BaseTokenFocusEffect"))
      ..add(ColorProperty("effectColor", effectColor))
      ..add(DoubleProperty("effectExtent", effectExtent))
      ..add(DiagnosticsProperty<Duration>("effectDuration", effectDuration))
      ..add(DiagnosticsProperty<Curve>("effectCurve", effectCurve));
  }
}
