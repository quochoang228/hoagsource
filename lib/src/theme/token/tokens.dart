import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hoagsource/hoagsource.dart';

@immutable
class BaseTokens extends ThemeExtension<BaseTokens> with DiagnosticableTreeMixin {
  static const light = BaseTokens(
    borders: BaseTokenBorders.borders,
    colors: BaseTokenColors.light,
    complementaryColors: BaseTokenColors.dark,
    opacities: BaseTokenOpacities.opacities,
    shadows: BaseTokenShadows.light,
    sizes: BaseTokenSizes.sizes,
    transitions: BaseTokenTransitions.transitions,
    typography: BaseTokenTypography.typography,
  );

  static const dark = BaseTokens(
    borders: BaseTokenBorders.borders,
    colors: BaseTokenColors.dark,
    complementaryColors: BaseTokenColors.light,
    opacities: BaseTokenOpacities.opacities,
    shadows: BaseTokenShadows.dark,
    sizes: BaseTokenSizes.sizes,
    transitions: BaseTokenTransitions.transitions,
    typography: BaseTokenTypography.typography,
  );

  /// The borders of the BaseToken Design System.
  final BaseTokenBorders borders;

  /// The colors of the BaseToken Design System.
  final BaseTokenColors colors;

  /// The colors of the BaseToken Design System that are from complementary theme
  /// (light -> dark, dark -> light).
  final BaseTokenColors complementaryColors;

  /// The opacities of the BaseToken Design System.
  final BaseTokenOpacities opacities;

  /// The shadows of the BaseToken Design System.
  final BaseTokenShadows shadows;

  /// The sizes of the BaseToken Design System.
  final BaseTokenSizes sizes;

  final BaseTokenTransitions transitions;

  /// The typography of the BaseToken Design System.
  final BaseTokenTypography typography;

  const BaseTokens({
    required this.borders,
    required this.colors,
    required this.complementaryColors,
    required this.opacities,
    required this.shadows,
    required this.sizes,
    required this.transitions,
    required this.typography,
  });

  @override
  BaseTokens copyWith({
    BaseTokenBorders? borders,
    BaseTokenColors? colors,
    BaseTokenColors? complementaryColors,
    BaseTokenOpacities? opacities,
    BaseTokenShadows? shadows,
    BaseTokenSizes? sizes,
    BaseTokenTransitions? transitions,
    BaseTokenTypography? typography,
  }) {
    return BaseTokens(
      borders: borders ?? this.borders,
      colors: colors ?? this.colors,
      complementaryColors: complementaryColors ?? this.complementaryColors,
      opacities: opacities ?? this.opacities,
      shadows: shadows ?? this.shadows,
      sizes: sizes ?? this.sizes,
      transitions: transitions ?? this.transitions,
      typography: typography ?? this.typography,
    );
  }

  @override
  BaseTokens lerp(ThemeExtension<BaseTokens>? other, double t) {
    if (other is! BaseTokens) return this;

    return BaseTokens(
      borders: borders.lerp(other.borders, t),
      colors: colors.lerp(other.colors, t),
      complementaryColors: complementaryColors.lerp(other.complementaryColors, t),
      opacities: opacities.lerp(other.opacities, t),
      shadows: shadows.lerp(other.shadows, t),
      sizes: sizes.lerp(other.sizes, t),
      transitions: transitions.lerp(other.transitions, t),
      typography: typography.lerp(other.typography, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "BaseTokens"))
      ..add(DiagnosticsProperty<BaseTokenBorders>("BaseTokenBorders", borders))
      ..add(DiagnosticsProperty<BaseTokenColors>("BaseTokenColors", colors))
      ..add(DiagnosticsProperty<BaseTokenColors>("BaseTokenColors", complementaryColors))
      ..add(DiagnosticsProperty<BaseTokenOpacities>("BaseTokenOpacities", opacities))
      ..add(DiagnosticsProperty<BaseTokenShadows>("BaseTokenShadows", shadows))
      ..add(DiagnosticsProperty<BaseTokenSizes>("BaseTokenSizes", sizes))
      ..add(
        DiagnosticsProperty<BaseTokenTransitions>(
          "BaseTokenTransitions",
          transitions,
        ),
      )
      ..add(
        DiagnosticsProperty<BaseTokenTypography>(
          "BaseTokenTypography",
          typography,
        ),
      );
  }
}
