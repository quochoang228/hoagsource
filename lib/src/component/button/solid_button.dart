import 'package:flutter/material.dart';

import '../../../hoagsource.dart';

class BaseSolidButton extends StatelessWidget {
  final String label;
  final Widget? icon;
  final VoidCallback? onPressed;
  final ButtonStyle? style;
  final AlignmentGeometry? alignment;
  final TextStyle? textStyle;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final ButtonIconPosition buttonIconPosition;

  final Color backgroundColor;
  final Color backgroundColorPressed;
  final Color backgroundColorDisabled;

  final Color foregroundColor;
  final Color foregroundColorPressed;
  final Color foregroundColorDisabled;

  const BaseSolidButton({
    super.key,
    required this.label,
    this.icon,
    this.onPressed,
    this.buttonIconPosition = ButtonIconPosition.ltr,
    this.style,
    this.alignment,
    this.textStyle,
    this.elevation,
    this.padding,
    this.borderRadius,
    this.backgroundColor = CoreColors.primary,
    this.backgroundColorPressed = CoreColors.primary06,
    this.backgroundColorDisabled = CoreColors.primary02,
    this.foregroundColor = CoreColors.white,
    this.foregroundColorPressed = CoreColors.white,
    this.foregroundColorDisabled = CoreColors.white,
  });

  const BaseSolidButton.secondary({
    super.key,
    required this.label,
    this.icon,
    this.onPressed,
    this.buttonIconPosition = ButtonIconPosition.ltr,
    this.style,
    this.alignment,
    this.textStyle,
    this.elevation,
    this.padding,
    this.borderRadius,
    this.backgroundColor = CoreColors.neutral01,
    this.backgroundColorPressed = CoreColors.neutral04,
    this.backgroundColorDisabled = CoreColors.neutral01,
    this.foregroundColor = CoreColors.neutral09,
    this.foregroundColorPressed = CoreColors.neutral09,
    this.foregroundColorDisabled = CoreColors.neutral03,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: key,
      onPressed: onPressed,
      style: style ??
          ButtonStyle(
            alignment: alignment ?? Alignment.center,
            elevation: WidgetStatePropertyAll(elevation ?? 0.0),
            textStyle: WidgetStatePropertyAll(
              textStyle ?? BaseTextStyle.labelLarge,
            ),
            backgroundColor: WidgetStateProperty.resolveWith(
              (states) {
                if (states.contains(WidgetState.disabled)) {
                  return backgroundColorDisabled;
                } else if (states.contains(WidgetState.pressed)) {
                  return backgroundColorPressed;
                } else {
                  return backgroundColor;
                }
              },
            ),
            foregroundColor: WidgetStateProperty.resolveWith(
              (states) {
                if (states.contains(WidgetState.disabled)) {
                  return foregroundColorDisabled;
                } else if (states.contains(WidgetState.pressed)) {
                  return foregroundColorPressed;
                } else {
                  return foregroundColor;
                }
              },
            ),
            padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
              padding ??
                  const EdgeInsets.symmetric(
                      vertical: BaseSpacing.spacing3,
                      horizontal: BaseSpacing.spacing6),
            ),
            shape: WidgetStatePropertyAll<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius:
                    borderRadius ?? BorderRadius.circular(BaseRadius.radiusLd),
              ),
            ),
          ),
      child: icon != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              textDirection: buttonIconPosition == ButtonIconPosition.ltr
                  ? TextDirection.ltr
                  : TextDirection.rtl,
              children: [
                icon!,
                const SizedBox(
                  width: BaseSpacing.spacing2,
                ),
                Text(
                  label,
                  style: textStyle ?? BaseTextStyle.labelLarge,
                ),
              ],
            )
          : Center(
              child: Text(
                label,
                style: textStyle ?? BaseTextStyle.labelLarge,
              ),
            ),
    );
  }
}
