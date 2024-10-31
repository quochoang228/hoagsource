import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hoagsource/hoagsource.dart';

@immutable
class BaseAlertColors extends ThemeExtension<BaseAlertColors>
    with DiagnosticableTreeMixin {
  /// The background color of the MoonAlert.
  final Color backgroundColor;

  /// The border color of the MoonAlert.
  final Color borderColor;

  /// The icon color of the MoonAlert.
  final Color iconColor;

  /// The text color of the MoonAlert.
  final Color textColor;

  const BaseAlertColors({
    required this.backgroundColor,
    required this.borderColor,
    required this.iconColor,
    required this.textColor,
  });

  @override
  BaseAlertColors copyWith({
    Color? backgroundColor,
    Color? borderColor,
    Color? iconColor,
    Color? textColor,
  }) {
    return BaseAlertColors(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
      iconColor: iconColor ?? this.iconColor,
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  BaseAlertColors lerp(ThemeExtension<BaseAlertColors>? other, double t) {
    if (other is! BaseAlertColors) return this;

    return BaseAlertColors(
      backgroundColor:
          colorPremulLerp(backgroundColor, other.backgroundColor, t)!,
      borderColor: colorPremulLerp(borderColor, other.borderColor, t)!,
      iconColor: colorPremulLerp(iconColor, other.iconColor, t)!,
      textColor: colorPremulLerp(textColor, other.textColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "BaseAlertColors"))
      ..add(ColorProperty("backgroundColor", backgroundColor))
      ..add(ColorProperty("borderColor", borderColor))
      ..add(ColorProperty("iconColor", iconColor))
      ..add(ColorProperty("textColor", textColor));
  }
}
