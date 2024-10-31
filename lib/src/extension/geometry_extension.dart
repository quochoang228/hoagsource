import 'package:flutter/material.dart';
import 'package:hoagsource/hoagsource.dart';

extension BorderRadiusGeometryX on BorderRadiusGeometry {
  BaseSquircleBorderRadius squircleBorderRadius(BuildContext context) {
    final borderRadius = resolve(Directionality.of(context));

    return BaseSquircleBorderRadius.only(
      topLeft: BaseSquircleRadius(cornerRadius: borderRadius.topLeft.x),
      topRight: BaseSquircleRadius(cornerRadius: borderRadius.topRight.x),
      bottomLeft: BaseSquircleRadius(cornerRadius: borderRadius.bottomLeft.x),
      bottomRight: BaseSquircleRadius(cornerRadius: borderRadius.bottomRight.x),
    );
  }
}