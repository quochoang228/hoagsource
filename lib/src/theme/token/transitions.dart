import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class BaseTokenTransitions extends ThemeExtension<BaseTokenTransitions>
    with DiagnosticableTreeMixin {
  static const transitions = BaseTokenTransitions(
    defaultTransitionDuration: Duration(milliseconds: 200),
    defaultTransitionCurve: Curves.easeInOutCubic,
  );

  /// The default transition duration.
  final Duration defaultTransitionDuration;

  /// The default transition curve.
  final Curve defaultTransitionCurve;

  const BaseTokenTransitions({
    required this.defaultTransitionDuration,
    required this.defaultTransitionCurve,
  });

  @override
  BaseTokenTransitions copyWith({
    Duration? defaultTransitionDuration,
    Curve? defaultTransitionCurve,
  }) {
    return BaseTokenTransitions(
      defaultTransitionDuration:
      defaultTransitionDuration ?? this.defaultTransitionDuration,
      defaultTransitionCurve:
      defaultTransitionCurve ?? this.defaultTransitionCurve,
    );
  }

  @override
  BaseTokenTransitions lerp(ThemeExtension<BaseTokenTransitions>? other, double t) {
    if (other is! BaseTokenTransitions) return this;

    return BaseTokenTransitions(
      defaultTransitionDuration: lerpDuration(
        defaultTransitionDuration,
        other.defaultTransitionDuration,
        t,
      ),
      defaultTransitionCurve: other.defaultTransitionCurve,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty(
          "type",
          "BaseTokenTransitions",
        ),
      )
      ..add(
        DiagnosticsProperty<Duration>(
          "defaultTransitionDuration",
          defaultTransitionDuration,
        ),
      )
      ..add(
        DiagnosticsProperty<Curve>(
          "defaultTransitionCurve",
          defaultTransitionCurve,
        ),
      );
  }
}