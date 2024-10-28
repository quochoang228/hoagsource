import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hoagsource/hoagsource.dart';

@immutable
class BaseTokenTypography extends ThemeExtension<BaseTokenTypography> with DiagnosticableTreeMixin {
  static const typography = BaseTokenTypography(
    body: BaseTokenTextStyles.body,
    heading: BaseTokenTextStyles.heading,
  );

  /// The text styles for the body.
  final BaseTokenTextStyles body;

  /// The text styles for the heading.
  final BaseTokenTextStyles heading;

  const BaseTokenTypography({required this.body, required this.heading});

  @override
  BaseTokenTypography copyWith({BaseTokenTextStyles? body, BaseTokenTextStyles? heading}) {
    return BaseTokenTypography(
      body: body ?? this.body,
      heading: heading ?? this.heading,
    );
  }

  @override
  BaseTokenTypography lerp(ThemeExtension<BaseTokenTypography>? other, double t) {
    if (other is! BaseTokenTypography) return this;

    return BaseTokenTypography(
      body: body.lerp(other.body, t),
      heading: heading.lerp(other.heading, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "BaseTokenTypography"))
      ..add(DiagnosticsProperty("body", body))
      ..add(DiagnosticsProperty("heading", heading));
  }
}
