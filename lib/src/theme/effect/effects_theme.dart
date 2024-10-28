import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hoagsource/hoagsource.dart';

@immutable
class BaseTokenEffectsTheme extends ThemeExtension<BaseTokenEffectsTheme> with DiagnosticableTreeMixin {
  /// The tokens of the  Base Design System.
  final BaseTokens tokens;

  /// The focus effect properties of the control widgets.
  final BaseFocusEffect controlFocusEffect;

  /// The hover effect properties of the control widgets.
  final BaseHoverEffect controlHoverEffect;

  /// The pulse effect properties of the control widgets.
  final BaseControlEffect controlPulseEffect;

  /// The scale effect properties of the control widgets.
  final BaseControlEffect controlScaleEffect;

  BaseTokenEffectsTheme({
    required this.tokens,
    BaseFocusEffect? controlFocusEffect,
    BaseHoverEffect? controlHoverEffect,
    BaseControlEffect? controlPulseEffect,
    BaseControlEffect? controlScaleEffect,
  })  : controlFocusEffect = controlFocusEffect ??
            BaseFocusEffect(
              effectColor: tokens.colors.bulma.withOpacity(0.25),
              effectExtent: 4,
              effectDuration: tokens.transitions.defaultTransitionDuration,
              effectCurve: tokens.transitions.defaultTransitionCurve,
            ),
        controlHoverEffect = controlHoverEffect ??
            BaseHoverEffect(
              primaryHoverColor: tokens.colors.heles,
              secondaryHoverColor: tokens.colors.jiren,
              hoverDuration: tokens.transitions.defaultTransitionDuration,
              hoverCurve: tokens.transitions.defaultTransitionCurve,
            ),
        controlPulseEffect = controlPulseEffect ??
            BaseControlEffect(
              effectColor: tokens.colors.piccolo,
              effectDuration: const Duration(milliseconds: 1400),
              effectCurve: tokens.transitions.defaultTransitionCurve,
              effectExtent: 24,
            ),
        controlScaleEffect = controlScaleEffect ??
            BaseControlEffect(
              effectDuration: tokens.transitions.defaultTransitionDuration,
              effectCurve: tokens.transitions.defaultTransitionCurve,
              effectScalar: 0.95,
            );

  @override
  BaseTokenEffectsTheme copyWith({
    BaseTokens? tokens,
    BaseFocusEffect? controlFocusEffect,
    BaseHoverEffect? controlHoverEffect,
    BaseControlEffect? controlPulseEffect,
    BaseControlEffect? controlScaleEffect,
  }) {
    return BaseTokenEffectsTheme(
      tokens: tokens ?? this.tokens,
      controlFocusEffect: controlFocusEffect ?? this.controlFocusEffect,
      controlHoverEffect: controlHoverEffect ?? this.controlHoverEffect,
      controlPulseEffect: controlPulseEffect ?? this.controlPulseEffect,
      controlScaleEffect: controlScaleEffect ?? this.controlScaleEffect,
    );
  }

  @override
  BaseTokenEffectsTheme lerp(ThemeExtension<BaseTokenEffectsTheme>? other, double t) {
    if (other is! BaseTokenEffectsTheme) return this;

    return BaseTokenEffectsTheme(
      tokens: tokens.lerp(other.tokens, t),
      controlFocusEffect: controlFocusEffect.lerp(other.controlFocusEffect, t),
      controlHoverEffect: controlHoverEffect.lerp(other.controlHoverEffect, t),
      controlScaleEffect: controlScaleEffect.lerp(other.controlScaleEffect, t),
      controlPulseEffect: controlPulseEffect.lerp(other.controlPulseEffect, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", " BaseEffectsTheme"))
      ..add(DiagnosticsProperty<BaseTokens>("tokens", tokens))
      ..add(
        DiagnosticsProperty<BaseControlEffect>(
          "controlScaleEffect",
          controlScaleEffect,
        ),
      )
      ..add(
        DiagnosticsProperty<BaseControlEffect>(
          "controlPulseEffect",
          controlPulseEffect,
        ),
      )
      ..add(
        DiagnosticsProperty<BaseFocusEffect>(
          "controlFocusEffect",
          controlFocusEffect,
        ),
      )
      ..add(
        DiagnosticsProperty<BaseHoverEffect>(
          "controlHoverEffect",
          controlHoverEffect,
        ),
      );
  }
}
