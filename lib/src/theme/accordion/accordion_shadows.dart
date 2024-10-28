import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class BaseAccordionShadows extends ThemeExtension<BaseAccordionShadows>
    with DiagnosticableTreeMixin {
  /// The list of shadows applied to the MoonAccordion.
  final List<BoxShadow> shadows;

  const BaseAccordionShadows({required this.shadows});

  @override
  BaseAccordionShadows copyWith({List<BoxShadow>? shadows}) {
    return BaseAccordionShadows(
      shadows: shadows ?? this.shadows,
    );
  }

  @override
  BaseAccordionShadows lerp(
      ThemeExtension<BaseAccordionShadows>? other,
      double t,
      ) {
    if (other is! BaseAccordionShadows) return this;

    return BaseAccordionShadows(
      shadows: BoxShadow.lerpList(shadows, other.shadows, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "BaseAccordionShadows"))
      ..add(DiagnosticsProperty<List<BoxShadow>>("shadows", shadows));
  }
}