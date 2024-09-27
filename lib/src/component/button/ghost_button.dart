import 'package:flutter/material.dart';

import '../../../hoagsource.dart';

class BaseGhostButton extends StatelessWidget {
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

  const BaseGhostButton({
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

  const BaseGhostButton.secondary({
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
            elevation: MaterialStatePropertyAll(elevation ?? 0.0),
            textStyle: MaterialStatePropertyAll(
              textStyle ?? BaseTextStyle.labelLarge,
            ),
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.disabled)) {
                  return backgroundColorDisabled;
                } else if (states.contains(MaterialState.pressed)) {
                  return backgroundColorPressed;
                } else {
                  return backgroundColor;
                }
              },
            ),
            foregroundColor: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.disabled)) {
                  return foregroundColorDisabled.withOpacity(0.5);
                } else if (states.contains(MaterialState.pressed)) {
                  return foregroundColorPressed;
                } else {
                  return foregroundColor;
                }
              },
            ),
            padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
              padding ??
                  const EdgeInsets.symmetric(
                      vertical: BaseSpacing.spacing3,
                      horizontal: BaseSpacing.spacing6),
            ),
            side: MaterialStateProperty.resolveWith(
              (states) {
                var color = borderColor;
                if (states.contains(MaterialState.disabled)) {
                  color = borderColor.withOpacity(0.5);
                }
                return BorderSide(
                  color: color,
                  width: 1,
                  style: BorderStyle.solid,
                );
              },
            ),
            shape: MaterialStatePropertyAll<OutlinedBorder>(
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
                Text(label),
              ],
            )
          : Center(
              child: Text(label),
            ),
    );
  }
}
