import 'package:flutter/material.dart';

import '../../../hoagsource.dart';

class HoagCircularElevatedButton extends StatelessWidget {
  const HoagCircularElevatedButton({required this.onPressed, required this.icon, super.key});

  final Widget icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final iconColor = HoagColors.textBody;
    final fillColor = HoagColors.backgroundGray1;
    return RawMaterialButton(
      elevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      hoverElevation: 0,
      fillColor: fillColor,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      highlightColor: iconColor.withOpacity(.1),
      splashColor: iconColor.withOpacity(.1),
      constraints: const BoxConstraints.expand(width: 24, height: 24),
      onPressed: onPressed,
      shape: const CircleBorder(),
      child: icon,
    );
  }
}