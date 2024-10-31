// ignore_for_file: overridden_fields, unused_element

import 'package:flutter/rendering.dart';
import 'package:hoagsource/hoagsource.dart';

class BaseSquircleBorderRadius extends BorderRadius {
  /// The border radius with zero radii.
  static const BaseSquircleBorderRadius zero = BaseSquircleBorderRadius.all(BaseSquircleRadius.zero);

  /// The top-left [BaseSquircleRadius].
  @override
  final BaseSquircleRadius topLeft;

  /// The top-right [BaseSquircleRadius].
  @override
  final BaseSquircleRadius topRight;

  /// The bottom-left [BaseSquircleRadius].
  @override
  final BaseSquircleRadius bottomLeft;

  /// The bottom-right [BaseSquircleRadius].
  @override
  final BaseSquircleRadius bottomRight;

  BaseSquircleBorderRadius({
    required double cornerRadius,
    // The value of 1 or 1.0 leads to NaN error in mobile web/PWA. Hence, we use
    // 0.9 instead to avoid this issue.
    double cornerSmoothing = 0.9,
  }) : this.only(
          topLeft: BaseSquircleRadius(
            cornerRadius: cornerRadius,
            cornerSmoothing: cornerSmoothing,
          ),
          topRight: BaseSquircleRadius(
            cornerRadius: cornerRadius,
            cornerSmoothing: cornerSmoothing,
          ),
          bottomLeft: BaseSquircleRadius(
            cornerRadius: cornerRadius,
            cornerSmoothing: cornerSmoothing,
          ),
          bottomRight: BaseSquircleRadius(
            cornerRadius: cornerRadius,
            cornerSmoothing: cornerSmoothing,
          ),
        );

  /// Creates a border radius with all radii set to [radius].
  const BaseSquircleBorderRadius.all(BaseSquircleRadius radius)
      : this.only(
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        );

  /// Creates a border radius with vertical symmetry, ensuring that the top and
  /// bottom sides of the rectangle have the same radii.
  const BaseSquircleBorderRadius.vertical({
    BaseSquircleRadius top = BaseSquircleRadius.zero,
    BaseSquircleRadius bottom = BaseSquircleRadius.zero,
  }) : this.only(
          topLeft: top,
          topRight: top,
          bottomLeft: bottom,
          bottomRight: bottom,
        );

  /// Creates a border radius with horizontal symmetry, ensuring that the left
  /// and right sides of the rectangle have the same radii.
  const BaseSquircleBorderRadius.horizontal({
    BaseSquircleRadius left = BaseSquircleRadius.zero,
    BaseSquircleRadius right = BaseSquircleRadius.zero,
  }) : this.only(
          topLeft: left,
          topRight: right,
          bottomLeft: left,
          bottomRight: right,
        );

  /// Creates a border radius with only the provided non-zero values, resulting
  /// in right angles for the other corners.
  const BaseSquircleBorderRadius.only({
    this.topLeft = BaseSquircleRadius.zero,
    this.topRight = BaseSquircleRadius.zero,
    this.bottomLeft = BaseSquircleRadius.zero,
    this.bottomRight = BaseSquircleRadius.zero,
  }) : super.only(
          topLeft: topLeft,
          bottomRight: topRight,
          topRight: topRight,
          bottomLeft: bottomLeft,
        );

  /// Required by Flutter framework internals for proper functioning.
  Radius get _topLeft => topLeft;

  Radius get _topRight => topRight;

  Radius get _bottomLeft => bottomLeft;

  Radius get _bottomRight => bottomRight;

  Radius get _topStart => Radius.zero;

  Radius get _topEnd => Radius.zero;

  Radius get _bottomStart => Radius.zero;

  Radius get _bottomEnd => Radius.zero;

  /// Returns a copy of this BorderRadius with the given fields replaced with
  /// the new values.
  @override
  BaseSquircleBorderRadius copyWith({
    Radius? topLeft,
    Radius? topRight,
    Radius? bottomLeft,
    Radius? bottomRight,
  }) {
    return BaseSquircleBorderRadius.only(
      topLeft: topLeft is BaseSquircleRadius ? topLeft : this.topLeft,
      topRight: topRight is BaseSquircleRadius ? topRight : this.topRight,
      bottomLeft: bottomLeft is BaseSquircleRadius ? bottomLeft : this.bottomLeft,
      bottomRight: bottomRight is BaseSquircleRadius ? bottomRight : this.bottomRight,
    );
  }

  /// Creates a [Path] inside the given [Rect].
  Path toPath(Rect rect) {
    final width = rect.width;
    final height = rect.height;

    final result = Path();

    /// Calculating only if values are different.
    final processedTopLeft = ProcessedSquircleRadius(
      topLeft,
      width: width,
      height: height,
    );

    final processedBottomLeft = topLeft == bottomLeft
        ? processedTopLeft
        : ProcessedSquircleRadius(
            bottomLeft,
            width: width,
            height: height,
          );

    final processedBottomRight = bottomLeft == bottomRight
        ? processedBottomLeft
        : ProcessedSquircleRadius(
            bottomRight,
            width: width,
            height: height,
          );

    final processedTopRight = topRight == bottomRight
        ? processedBottomRight
        : ProcessedSquircleRadius(
            topRight,
            width: width,
            height: height,
          );

    result
      ..addSmoothTopRight(processedTopRight, rect)
      ..addSmoothBottomRight(processedBottomRight, rect)
      ..addSmoothBottomLeft(processedBottomLeft, rect)
      ..addSmoothTopLeft(processedTopLeft, rect);

    return result.transform(
      Matrix4.translationValues(rect.left, rect.top, 0).storage,
    );
  }

  @override
  BorderRadiusGeometry subtract(BorderRadiusGeometry other) {
    if (other is BaseSquircleBorderRadius) return this - other;
    return super.subtract(other);
  }

  @override
  BorderRadiusGeometry add(BorderRadiusGeometry other) {
    if (other is BaseSquircleBorderRadius) return this + other;
    return super.add(other);
  }

  /// Returns the difference between two [BorderRadius] objects.
  @override
  BaseSquircleBorderRadius operator -(BorderRadius other) {
    if (other is BaseSquircleBorderRadius) {
      return BaseSquircleBorderRadius.only(
        topLeft: (topLeft - other.topLeft) as BaseSquircleRadius,
        topRight: (topRight - other.topRight) as BaseSquircleRadius,
        bottomLeft: (bottomLeft - other.bottomLeft) as BaseSquircleRadius,
        bottomRight: (bottomRight - other.bottomRight) as BaseSquircleRadius,
      );
    }

    return this;
  }

  /// Returns the sum of two [BorderRadius] objects.
  @override
  BaseSquircleBorderRadius operator +(BorderRadius other) {
    if (other is BaseSquircleBorderRadius) {
      return BaseSquircleBorderRadius.only(
        topLeft: (topLeft + other.topLeft) as BaseSquircleRadius,
        topRight: (topRight + other.topRight) as BaseSquircleRadius,
        bottomLeft: (bottomLeft + other.bottomLeft) as BaseSquircleRadius,
        bottomRight: (bottomRight + other.bottomRight) as BaseSquircleRadius,
      );
    }

    return this;
  }

  /// Returns the [BorderRadius] object with each corner negated.
  ///
  /// This is the same as multiplying the object by -1.0.
  @override
  BaseSquircleBorderRadius operator -() {
    return BaseSquircleBorderRadius.only(
      topLeft: (-topLeft) as BaseSquircleRadius,
      topRight: (-topRight) as BaseSquircleRadius,
      bottomLeft: (-bottomLeft) as BaseSquircleRadius,
      bottomRight: (-bottomRight) as BaseSquircleRadius,
    );
  }

  /// Scales each corner of the [BorderRadius] by the given factor.
  @override
  BaseSquircleBorderRadius operator *(double other) {
    return BaseSquircleBorderRadius.only(
      topLeft: topLeft * other,
      topRight: topRight * other,
      bottomLeft: bottomLeft * other,
      bottomRight: bottomRight * other,
    );
  }

  /// Divides each corner of the [BorderRadius] by the given factor.
  @override
  BaseSquircleBorderRadius operator /(double other) {
    return BaseSquircleBorderRadius.only(
      topLeft: topLeft / other,
      topRight: topRight / other,
      bottomLeft: bottomLeft / other,
      bottomRight: bottomRight / other,
    );
  }

  /// Integer divides each corner of the [BorderRadius] by the given factor.
  @override
  BaseSquircleBorderRadius operator ~/(double other) {
    return BaseSquircleBorderRadius.only(
      topLeft: topLeft ~/ other,
      topRight: topRight ~/ other,
      bottomLeft: bottomLeft ~/ other,
      bottomRight: bottomRight ~/ other,
    );
  }

  /// Computes the remainder of each corner by the given factor.
  @override
  BaseSquircleBorderRadius operator %(double other) {
    return BaseSquircleBorderRadius.only(
      topLeft: topLeft % other,
      topRight: topRight % other,
      bottomLeft: bottomLeft % other,
      bottomRight: bottomRight % other,
    );
  }

  /// Linearly interpolate between two [BorderRadius] objects.
  ///
  /// If either is null, this function interpolates from [BorderRadius.zero].
  ///
  /// {@macro dart.ui.shadow.lerp}
  static BaseSquircleBorderRadius? lerp(
    BaseSquircleBorderRadius? a,
    BaseSquircleBorderRadius? b,
    double t,
  ) {
    if (a == null && b == null) return null;
    if (a == null) return b! * t;
    if (b == null) return a * (1.0 - t);
    return BaseSquircleBorderRadius.only(
      topLeft: BaseSquircleRadius.lerp(a.topLeft, b.topLeft, t)!,
      topRight: BaseSquircleRadius.lerp(a.topRight, b.topRight, t)!,
      bottomLeft: BaseSquircleRadius.lerp(a.bottomLeft, b.bottomLeft, t)!,
      bottomRight: BaseSquircleRadius.lerp(a.bottomRight, b.bottomRight, t)!,
    );
  }

  @override
  BorderRadius resolve(TextDirection? direction) => BorderRadius.only(
        topLeft: topLeft,
        topRight: topRight,
        bottomLeft: bottomLeft,
        bottomRight: bottomRight,
      );

  @override
  String toString() {
    if (topLeft == topRight && topLeft == bottomRight && topLeft == bottomLeft) {
      final radius = topLeft.toString();
      return 'MoonSquircleBorderRadius${radius.substring(12)}';
    }

    return 'MoonSquircleBorderRadius('
        'topLeft: $topLeft, '
        'topRight: $topRight, '
        'bottomLeft: $bottomLeft, '
        'bottomRight: $bottomRight, '
        ')';
  }
}
