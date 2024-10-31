import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hoagsource/hoagsource.dart';

@immutable
class BaseAlertTheme extends ThemeExtension<BaseAlertTheme>
    with DiagnosticableTreeMixin {
  /// The tokens of the Base Design System.
  final BaseTokens tokens;

  /// The colors of the BaseAlert.
  final BaseAlertColors colors;

  /// The properties of the BaseAlert.
  final BaseAlertProperties properties;

  BaseAlertTheme({
    required this.tokens,
    BaseAlertColors? colors,
    BaseAlertProperties? properties,
  })  : colors = colors ??
            BaseAlertColors(
              backgroundColor: tokens.colors.goku,
              borderColor: tokens.colors.textSecondary,
              iconColor: tokens.colors.iconPrimary,
              textColor: tokens.colors.textPrimary,
            ),
        properties = properties ??
            BaseAlertProperties(
              borderRadius: tokens.borders.interactiveSm,
              horizontalGap: tokens.sizes.x3s,
              minimumHeight: tokens.sizes.xl,
              verticalGap: tokens.sizes.x4s,
              transitionDuration: tokens.transitions.defaultTransitionDuration,
              transitionCurve: tokens.transitions.defaultTransitionCurve,
              padding: EdgeInsets.all(tokens.sizes.x2s),
              contentTextStyle: tokens.typography.body.textDefault,
              labelTextStyle: tokens.typography.heading.textDefault,
            );

  @override
  BaseAlertTheme copyWith({
    BaseTokens? tokens,
    BaseAlertColors? colors,
    BaseAlertProperties? properties,
  }) {
    return BaseAlertTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
    );
  }

  @override
  BaseAlertTheme lerp(ThemeExtension<BaseAlertTheme>? other, double t) {
    if (other is! BaseAlertTheme) return this;

    return BaseAlertTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      properties: properties.lerp(other.properties, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder diagnosticProperties) {
    super.debugFillProperties(diagnosticProperties);
    diagnosticProperties
      ..add(DiagnosticsProperty("type", "BaseAlertTheme"))
      ..add(DiagnosticsProperty<BaseTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<BaseAlertColors>("colors", colors))
      ..add(DiagnosticsProperty<BaseAlertProperties>("properties", properties));
  }
}
