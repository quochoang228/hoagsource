import 'package:flutter/material.dart';

import '../../../hoagsource.dart';

class BaseDivider extends StatelessWidget {
  const BaseDivider({
    super.key,
    this.color,
    this.height = 1,
    this.padding,
  });

  final Color? color;
  final double? height;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? BaseColors.borderDivider,
      ),
      padding: padding,
      height: height,
    );
  }
}
