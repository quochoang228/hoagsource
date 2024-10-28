import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hoagsource/hoagsource.dart';

@immutable
class BaseAccordionTheme extends ThemeExtension<BaseAccordionTheme> with DiagnosticableTreeMixin {
  /// The tokens of the Base Design System.
  final BaseTokens tokens;

  /// The colors of the BaseAccordion.
  final BaseAccordionColors colors;

  /// The properties of the BaseAccordion.
  final BaseAccordionProperties properties;

  /// The shadows of the BaseAccordion.
  final BaseAccordionShadows shadows;

  /// The sizes of the BaseAccordion.
  final BaseAccordionSizes sizes;

  BaseAccordionTheme({
    required this.tokens,
    BaseAccordionColors? colors,
    BaseAccordionProperties? properties,
    BaseAccordionShadows? shadows,
    BaseAccordionSizes? sizes,
  })  : colors = colors ??
            BaseAccordionColors(
              textColor: tokens.colors.textPrimary,
              expandedTextColor: tokens.colors.textPrimary,
              contentColor: tokens.colors.textPrimary,
              iconColor: tokens.colors.iconPrimary,
              expandedIconColor: tokens.colors.iconPrimary,
              trailingIconColor: tokens.colors.iconPrimary,
              expandedTrailingIconColor: tokens.colors.iconSecondary,
              backgroundColor: tokens.colors.goku,
              expandedBackgroundColor: tokens.colors.goku,
              borderColor: tokens.colors.beerus,
              dividerColor: tokens.colors.beerus,
            ),
        properties = properties ??
            BaseAccordionProperties(
              transitionDuration: tokens.transitions.defaultTransitionDuration,
              transitionCurve: tokens.transitions.defaultTransitionCurve,
            ),
        shadows = shadows ?? BaseAccordionShadows(shadows: tokens.shadows.sm),
        sizes = sizes ?? BaseAccordionSizes(tokens: tokens);

  @override
  BaseAccordionTheme copyWith({
    BaseTokens? tokens,
    BaseAccordionColors? colors,
    BaseAccordionProperties? properties,
    BaseAccordionShadows? shadows,
    BaseAccordionSizes? sizes,
  }) {
    return BaseAccordionTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
      shadows: shadows ?? this.shadows,
      sizes: sizes ?? this.sizes,
    );
  }

  @override
  BaseAccordionTheme lerp(ThemeExtension<BaseAccordionTheme>? other, double t) {
    if (other is! BaseAccordionTheme) return this;

    return BaseAccordionTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      properties: properties.lerp(other.properties, t),
      shadows: shadows.lerp(other.shadows, t),
      sizes: sizes.lerp(other.sizes, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder diagnosticProperties) {
    super.debugFillProperties(diagnosticProperties);
    diagnosticProperties
      ..add(DiagnosticsProperty("type", "BaseAccordionTheme"))
      ..add(DiagnosticsProperty<BaseTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<BaseAccordionColors>("colors", colors))
      ..add(
        DiagnosticsProperty<BaseAccordionProperties>("properties", properties),
      )
      ..add(
        DiagnosticsProperty<BaseAccordionShadows>("shadows", shadows),
      )
      ..add(
        DiagnosticsProperty<BaseAccordionSizes>("sizes", sizes),
      );
  }
}
