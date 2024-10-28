import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class BaseTokenOpacities extends ThemeExtension<BaseTokenOpacities> with DiagnosticableTreeMixin {
  static const opacities = BaseTokenOpacities(disabled: 0.6);

  /// The disabled opacity value.
  final double disabled;

  const BaseTokenOpacities({
    required this.disabled,
  });

  @override
  BaseTokenOpacities copyWith({
    double? disabled,
  }) {
    return BaseTokenOpacities(
      disabled: disabled ?? this.disabled,
    );
  }

  @override
  BaseTokenOpacities lerp(ThemeExtension<BaseTokenOpacities>? other, double t) {
    if (other is! BaseTokenOpacities) return this;

    return BaseTokenOpacities(
      disabled: lerpDouble(disabled, other.disabled, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "BaseTokenOpacities"))
      ..add(DoubleProperty("disabled", disabled));
  }
}