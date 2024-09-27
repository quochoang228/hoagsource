import 'package:flutter/material.dart';

import '../../../../hoagsource.dart';

abstract class BaseButtonTheme {
  static ElevatedButtonThemeData primaryButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      alignment: Alignment.center,
      elevation: const MaterialStatePropertyAll(0),
      textStyle: const MaterialStatePropertyAll(
        BaseTextStyle.labelLarge,
      ),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          //=====DISABLED EVENT
          if (states.contains(MaterialState.disabled)) {
            return BaseColors.primary.withOpacity(0.5);
          } else if (states.contains(MaterialState.pressed)) {
            return BaseColors.primaryPressed;
          } else {
            return BaseColors.primary;
          }
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          //=====DISABLED EVENT
          if (states.contains(MaterialState.disabled)) {
            return BaseColors.textOnColor;
          } else if (states.contains(MaterialState.pressed)) {
            return BaseColors.textOnColor;
          } else {
            return BaseColors.textOnColor;
          }
        },
      ),
      padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(
            vertical: BaseSpacing.spacing3, horizontal: BaseSpacing.spacing6),
      ),
      shape: MaterialStatePropertyAll<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BaseRadius.radiusLd),
        ),
      ),
    ),
  );
}
