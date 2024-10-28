import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class BaseAccordionSizeProperties
    extends ThemeExtension<BaseAccordionSizeProperties>
    with DiagnosticableTreeMixin {
  /// The border radius of the MoonAccordion.
  final BorderRadiusGeometry borderRadius;

  /// The height of the MoonAccordion header.
  final double headerHeight;

  /// The size value of the MoonAccordion icon.
  final double iconSizeValue;

  /// The padding of the MoonAccordion header.
  final EdgeInsetsGeometry headerPadding;

  /// The text style of the MoonAccordion header.
  final TextStyle headerTextStyle;

  /// The text style of the MoonAccordion content.
  final TextStyle contentTextStyle;

  const BaseAccordionSizeProperties({
    required this.borderRadius,
    required this.headerHeight,
    required this.iconSizeValue,
    required this.headerPadding,
    required this.headerTextStyle,
    required this.contentTextStyle,
  });

  @override
  BaseAccordionSizeProperties copyWith({
    BorderRadiusGeometry? borderRadius,
    double? headerHeight,
    double? iconSizeValue,
    EdgeInsetsGeometry? headerPadding,
    TextStyle? headerTextStyle,
    TextStyle? contentTextStyle,
  }) {
    return BaseAccordionSizeProperties(
      borderRadius: borderRadius ?? this.borderRadius,
      headerHeight: headerHeight ?? this.headerHeight,
      iconSizeValue: iconSizeValue ?? this.iconSizeValue,
      headerPadding: headerPadding ?? this.headerPadding,
      headerTextStyle: headerTextStyle ?? this.headerTextStyle,
      contentTextStyle: contentTextStyle ?? this.contentTextStyle,
    );
  }

  @override
  BaseAccordionSizeProperties lerp(
      ThemeExtension<BaseAccordionSizeProperties>? other,
      double t,
      ) {
    if (other is! BaseAccordionSizeProperties) return this;

    return BaseAccordionSizeProperties(
      borderRadius:
      BorderRadiusGeometry.lerp(borderRadius, other.borderRadius, t)!,
      headerHeight: lerpDouble(headerHeight, other.headerHeight, t)!,
      iconSizeValue: lerpDouble(iconSizeValue, other.iconSizeValue, t)!,
      headerPadding:
      EdgeInsetsGeometry.lerp(headerPadding, other.headerPadding, t)!,
      headerTextStyle:
      TextStyle.lerp(headerTextStyle, other.headerTextStyle, t)!,
      contentTextStyle:
      TextStyle.lerp(contentTextStyle, other.contentTextStyle, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty("type", "BaseAccordionSizeProperties"),
      )
      ..add(
        DiagnosticsProperty<BorderRadiusGeometry>("borderRadius", borderRadius),
      )
      ..add(
        DoubleProperty("headerHeight", headerHeight),
      )
      ..add(
        DoubleProperty("iconSizeValue", iconSizeValue),
      )
      ..add(
        DiagnosticsProperty<EdgeInsetsGeometry>("headerPadding", headerPadding),
      )
      ..add(
        DiagnosticsProperty<TextStyle>("headerTextStyle", headerTextStyle),
      )
      ..add(
        DiagnosticsProperty<TextStyle>("contentTextStyle", contentTextStyle),
      );
  }
}