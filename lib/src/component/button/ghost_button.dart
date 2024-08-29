import 'package:flutter/material.dart';

import '../../../hoagsource.dart';

class HoagGhostButton extends StatelessWidget {
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

  final Color borderColor;

  const HoagGhostButton({
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
    this.backgroundColor = CoreColors.transparent,
    this.backgroundColorPressed = CoreColors.primary03,
    this.backgroundColorDisabled = CoreColors.transparent,
    this.foregroundColor = CoreColors.primary,
    this.foregroundColorPressed = CoreColors.primary,
    this.foregroundColorDisabled = CoreColors.primary,
    this.borderColor = CoreColors.primary,
  });

  const HoagGhostButton.secondary({
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
    this.backgroundColor = CoreColors.transparent,
    this.backgroundColorPressed = CoreColors.neutral01,
    this.backgroundColorDisabled = CoreColors.transparent,
    this.foregroundColor = CoreColors.neutral09,
    this.foregroundColorPressed = CoreColors.neutral09,
    this.foregroundColorDisabled = CoreColors.neutral09,
    this.borderColor = CoreColors.neutral04,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      key: key,
      onPressed: onPressed,
      style: style ??
          ButtonStyle(
            alignment: alignment ?? Alignment.center,
            elevation: WidgetStatePropertyAll(elevation ?? 0.0),
            textStyle: WidgetStatePropertyAll(
              textStyle ?? HoagTextStyle.labelLarge,
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
                  return foregroundColorDisabled.withOpacity(0.5);
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
                      vertical: HoagSpacing.spacing3,
                      horizontal: HoagSpacing.spacing6),
            ),
            side: WidgetStateProperty.resolveWith(
              (states) {
                var color = borderColor;
                if (states.contains(WidgetState.disabled)) {
                  color = borderColor.withOpacity(0.5);
                }
                return BorderSide(
                  color: color,
                  width: 1,
                  style: BorderStyle.solid,
                );
              },
            ),
            shape: WidgetStatePropertyAll<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius:
                    borderRadius ?? BorderRadius.circular(HoagRadius.radiusLd),
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
                  width: HoagSpacing.spacing2,
                ),
                Text(label),
              ],
            )
          : Center(
              child: Text(label),
            ),
    );
  }
}
