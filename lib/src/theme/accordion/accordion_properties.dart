import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class BaseAccordionProperties extends ThemeExtension<BaseAccordionProperties>
    with DiagnosticableTreeMixin {
  /// The duration of the MoonAccordion transition animation
  /// (expand and collapse).
  final Duration transitionDuration;

  /// The curve of the MoonAccordion transition animation (expand and collapse).
  final Curve transitionCurve;

  const BaseAccordionProperties({
    required this.transitionDuration,
    required this.transitionCurve,
  });

  @override
  BaseAccordionProperties copyWith({
    Duration? transitionDuration,
    Curve? transitionCurve,
  }) {
    return BaseAccordionProperties(
      transitionDuration: transitionDuration ?? this.transitionDuration,
      transitionCurve: transitionCurve ?? this.transitionCurve,
    );
  }

  @override
  BaseAccordionProperties lerp(
      ThemeExtension<BaseAccordionProperties>? other,
      double t,
      ) {
    if (other is! BaseAccordionProperties) return this;

    return BaseAccordionProperties(
      transitionDuration:
      lerpDuration(transitionDuration, other.transitionDuration, t),
      transitionCurve: other.transitionCurve,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty("type", "BaseAccordionProperties"),
      )
      ..add(
        DiagnosticsProperty<Duration>("transitionDuration", transitionDuration),
      )
      ..add(
        DiagnosticsProperty<Curve>("transitionCurve", transitionCurve),
      );
  }
}