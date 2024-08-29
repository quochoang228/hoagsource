import 'package:flutter/material.dart';

import '../../../hoagsource.dart';

class HoagTextButton extends StatelessWidget {
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

  const HoagTextButton({
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

    // background
    this.backgroundColor = CoreColors.transparent,
    this.backgroundColorPressed = CoreColors.primary03,
    this.backgroundColorDisabled = CoreColors.transparent,
    // foreground
    this.foregroundColor = CoreColors.primary,
    this.foregroundColorPressed = CoreColors.primary,
    this.foregroundColorDisabled = CoreColors.primary,
  });

  const HoagTextButton.secondary({
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
    // background
    this.backgroundColor = CoreColors.transparent,
    this.backgroundColorPressed = CoreColors.transparent,
    this.backgroundColorDisabled = CoreColors.transparent,
    // foreground
    this.foregroundColor = CoreColors.neutral10,
    this.foregroundColorPressed = CoreColors.neutral10,
    this.foregroundColorDisabled = CoreColors.neutral10,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
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
            shape: WidgetStatePropertyAll<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius:
                    borderRadius ?? BorderRadius.circular(HoagRadius.radiusLd),
              ),
            ),
            side: const WidgetStatePropertyAll<BorderSide>(
              BorderSide.none,
            ),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
