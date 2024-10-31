import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hoagsource/hoagsource.dart';

@immutable
class BaseAuthCodeTheme extends ThemeExtension<BaseAuthCodeTheme>
    with DiagnosticableTreeMixin {
  /// The tokens of the Base Design System.
  final BaseTokens tokens;

  /// The colors of the BaseAuthCode.
  final BaseAuthCodeColors colors;

  /// The properties of the BaseAuthCode.
  final BaseAuthCodeProperties properties;

  BaseAuthCodeTheme({
    required this.tokens,
    BaseAuthCodeColors? colors,
    BaseAuthCodeProperties? properties,
  })  : colors = colors ??
            BaseAuthCodeColors(
              selectedBorderColor: tokens.colors.piccolo,
              activeBorderColor: tokens.colors.beerus,
              inactiveBorderColor: tokens.colors.beerus,
              errorBorderColor: tokens.colors.chichi,
              selectedFillColor: tokens.colors.goku,
              activeFillColor: tokens.colors.goku,
              inactiveFillColor: tokens.colors.goku,
              textColor: tokens.colors.textPrimary,
            ),
        properties = properties ??
            BaseAuthCodeProperties(
              borderRadius: tokens.borders.interactiveSm,
              gap: tokens.sizes.x4s,
              height: tokens.sizes.xl,
              width: tokens.sizes.lg,
              animationDuration: tokens.transitions.defaultTransitionDuration,
              errorAnimationDuration:
                  tokens.transitions.defaultTransitionDuration,
              peekDuration: tokens.transitions.defaultTransitionDuration,
              animationCurve: tokens.transitions.defaultTransitionCurve,
              errorAnimationCurve: tokens.transitions.defaultTransitionCurve,
              textStyle: tokens.typography.body.text24,
              errorTextStyle: tokens.typography.body.text12,
            );

  @override
  BaseAuthCodeTheme copyWith({
    BaseTokens? tokens,
    BaseAuthCodeColors? colors,
    BaseAuthCodeProperties? properties,
  }) {
    return BaseAuthCodeTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
    );
  }

  @override
  BaseAuthCodeTheme lerp(ThemeExtension<BaseAuthCodeTheme>? other, double t) {
    if (other is! BaseAuthCodeTheme) return this;

    return BaseAuthCodeTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      properties: properties.lerp(other.properties, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder diagnosticProperties) {
    super.debugFillProperties(diagnosticProperties);
    diagnosticProperties
      ..add(DiagnosticsProperty("type", "BaseAuthCodeTheme"))
      ..add(DiagnosticsProperty<BaseTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<BaseAuthCodeColors>("colors", colors))
      ..add(
        DiagnosticsProperty<BaseAuthCodeProperties>("properties", properties),
      );
  }
}
