import 'package:flutter/material.dart';

import '../../../hoagsource.dart';

class HoagDivider extends StatelessWidget {
  const HoagDivider({
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
        color: color ?? HoagColors.borderDivider,
      ),
      padding: padding,
      height: height,
    );
  }
}
