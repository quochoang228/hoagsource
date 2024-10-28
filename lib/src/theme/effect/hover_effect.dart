import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hoagsource/hoagsource.dart';


@immutable
class BaseHoverEffect extends ThemeExtension<BaseHoverEffect>
    with DiagnosticableTreeMixin {
  /// The color of the primary hover effect.
  final Color primaryHoverColor;

  /// The color of the secondary hover effect.
  final Color secondaryHoverColor;

  /// The duration of the hover effect.
  final Duration hoverDuration;

  /// The curve of the hover effect.
  final Curve hoverCurve;

  const BaseHoverEffect({
    required this.primaryHoverColor,
    required this.secondaryHoverColor,
    required this.hoverDuration,
    required this.hoverCurve,
  });

  @override
  BaseHoverEffect copyWith({
    Color? primaryHoverColor,
    Color? secondaryHoverColor,
    Duration? hoverDuration,
    Curve? hoverCurve,
  }) {
    return BaseHoverEffect(
      primaryHoverColor: primaryHoverColor ?? this.primaryHoverColor,
      secondaryHoverColor: secondaryHoverColor ?? this.secondaryHoverColor,
      hoverDuration: hoverDuration ?? this.hoverDuration,
      hoverCurve: hoverCurve ?? this.hoverCurve,
    );
  }

  @override
  BaseHoverEffect lerp(ThemeExtension<BaseHoverEffect>? other, double t) {
    if (other is! BaseHoverEffect) return this;

    return BaseHoverEffect(
      primaryHoverColor:
      colorPremulLerp(primaryHoverColor, other.primaryHoverColor, t)!,
      secondaryHoverColor:
      colorPremulLerp(secondaryHoverColor, other.secondaryHoverColor, t)!,
      hoverDuration: lerpDuration(hoverDuration, other.hoverDuration, t),
      hoverCurve: other.hoverCurve,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "MoonHoverEffects"))
      ..add(ColorProperty("primaryHoverColor", primaryHoverColor))
      ..add(ColorProperty("secondaryHoverColor", secondaryHoverColor))
      ..add(DiagnosticsProperty<Duration>("hoverDuration", hoverDuration))
      ..add(DiagnosticsProperty<Curve>("hoverCurve", hoverCurve));
  }
}
