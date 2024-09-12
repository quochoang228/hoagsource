import 'package:flutter/material.dart';

import '../../../../hoagsource.dart';

abstract class BaseButtonTheme {
  static ElevatedButtonThemeData primaryButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      alignment: Alignment.center,
      elevation: const WidgetStatePropertyAll(0),
      textStyle: const WidgetStatePropertyAll(
        BaseTextStyle.labelLarge,
      ),
      backgroundColor: WidgetStateProperty.resolveWith(
        (states) {
          //=====DISABLED EVENT
          if (states.contains(WidgetState.disabled)) {
            return BaseColors.primary.withOpacity(0.5);
          } else if (states.contains(WidgetState.pressed)) {
            return BaseColors.primaryPressed;
          } else {
            return BaseColors.primary;
          }
        },
      ),
      foregroundColor: WidgetStateProperty.resolveWith(
        (states) {
          //=====DISABLED EVENT
          if (states.contains(WidgetState.disabled)) {
            return BaseColors.textOnColor;
          } else if (states.contains(WidgetState.pressed)) {
            return BaseColors.textOnColor;
          } else {
            return BaseColors.textOnColor;
          }
        },
      ),
      padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(
            vertical: BaseSpacing.spacing3, horizontal: BaseSpacing.spacing6),
      ),
      shape: WidgetStatePropertyAll<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BaseRadius.radiusLd),
        ),
      ),
    ),
  );
}
