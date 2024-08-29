import 'package:flutter/material.dart';

import '../../../../hoagsource.dart';

abstract class HoagButtonTheme {
  static ElevatedButtonThemeData primaryButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      alignment: Alignment.center,
      elevation: const WidgetStatePropertyAll(0),
      textStyle: const WidgetStatePropertyAll(
        HoagTextStyle.labelLarge,
      ),
      backgroundColor: WidgetStateProperty.resolveWith(
        (states) {
          //=====DISABLED EVENT
          if (states.contains(WidgetState.disabled)) {
            return HoagColors.primary.withOpacity(0.5);
          } else if (states.contains(WidgetState.pressed)) {
            return HoagColors.primaryPressed;
          } else {
            return HoagColors.primary;
          }
        },
      ),
      foregroundColor: WidgetStateProperty.resolveWith(
        (states) {
          //=====DISABLED EVENT
          if (states.contains(WidgetState.disabled)) {
            return HoagColors.textOnColor;
          } else if (states.contains(WidgetState.pressed)) {
            return HoagColors.textOnColor;
          } else {
            return HoagColors.textOnColor;
          }
        },
      ),
      padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(
            vertical: HoagSpacing.spacing3, horizontal: HoagSpacing.spacing6),
      ),
      shape: WidgetStatePropertyAll<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(HoagRadius.radiusLd),
        ),
      ),
    ),
  );
}
