import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hoagsource/hoagsource.dart';

import 'accordion_size_properties.dart';

@immutable
class BaseAccordionSizes extends ThemeExtension<BaseAccordionSizes> with DiagnosticableTreeMixin {
  /// The tokens of the Moon Design System.
  final BaseTokens tokens;

  /// The properties of the small MoonAccordion.
  final BaseAccordionSizeProperties sm;

  /// The properties of the medium MoonAccordion.
  final BaseAccordionSizeProperties md;

  /// The properties of the large MoonAccordion.
  final BaseAccordionSizeProperties lg;

  /// The properties of the extra large MoonAccordion.
  final BaseAccordionSizeProperties xl;

  BaseAccordionSizes({
    required this.tokens,
    BaseAccordionSizeProperties? sm,
    BaseAccordionSizeProperties? md,
    BaseAccordionSizeProperties? lg,
    BaseAccordionSizeProperties? xl,
  })  : sm = sm ??
            BaseAccordionSizeProperties(
              borderRadius: tokens.borders.interactiveSm,
              headerHeight: tokens.sizes.sm,
              iconSizeValue: tokens.sizes.x2s,
              headerPadding: EdgeInsets.symmetric(horizontal: tokens.sizes.x4s),
              headerTextStyle: tokens.typography.heading.text12,
              contentTextStyle: tokens.typography.body.text12,
            ),
        md = md ??
            BaseAccordionSizeProperties(
              borderRadius: tokens.borders.interactiveSm,
              headerHeight: tokens.sizes.md,
              iconSizeValue: tokens.sizes.xs,
              headerPadding: EdgeInsets.symmetric(horizontal: tokens.sizes.x3s),
              headerTextStyle: tokens.typography.heading.textDefault,
              contentTextStyle: tokens.typography.body.textDefault,
            ),
        lg = lg ??
            BaseAccordionSizeProperties(
              borderRadius: tokens.borders.interactiveSm,
              headerHeight: tokens.sizes.lg,
              iconSizeValue: tokens.sizes.xs,
              headerPadding: EdgeInsets.symmetric(horizontal: tokens.sizes.x3s),
              headerTextStyle: tokens.typography.heading.textDefault,
              contentTextStyle: tokens.typography.body.textDefault,
            ),
        xl = xl ??
            BaseAccordionSizeProperties(
              borderRadius: tokens.borders.interactiveSm,
              headerHeight: tokens.sizes.xl,
              iconSizeValue: tokens.sizes.xs,
              headerPadding: EdgeInsets.symmetric(horizontal: tokens.sizes.x2s),
              headerTextStyle: tokens.typography.heading.text16,
              contentTextStyle: tokens.typography.body.textDefault,
            );

  @override
  BaseAccordionSizes copyWith({
    BaseTokens? tokens,
    BaseAccordionSizeProperties? sm,
    BaseAccordionSizeProperties? md,
    BaseAccordionSizeProperties? lg,
    BaseAccordionSizeProperties? xl,
  }) {
    return BaseAccordionSizes(
      tokens: tokens ?? this.tokens,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
    );
  }

  @override
  BaseAccordionSizes lerp(ThemeExtension<BaseAccordionSizes>? other, double t) {
    if (other is! BaseAccordionSizes) return this;

    return BaseAccordionSizes(
      tokens: tokens.lerp(other.tokens, t),
      sm: sm.lerp(other.sm, t),
      md: md.lerp(other.md, t),
      lg: lg.lerp(other.lg, t),
      xl: xl.lerp(other.xl, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "BaseAccordionSizes"))
      ..add(DiagnosticsProperty<BaseTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<BaseAccordionSizeProperties>("sm", sm))
      ..add(DiagnosticsProperty<BaseAccordionSizeProperties>("md", md))
      ..add(DiagnosticsProperty<BaseAccordionSizeProperties>("lg", lg))
      ..add(DiagnosticsProperty<BaseAccordionSizeProperties>("xl", xl));
  }
}
