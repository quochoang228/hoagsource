import 'package:flutter/material.dart';

import '../../../hoagsource.dart';

typedef OnCheckBoxChange<bool> = bool Function(bool value);

class HoagCheckBox extends StatelessWidget {
  const HoagCheckBox({
    super.key,
    required this.onCheckBoxChange,
    required this.value,
    this.shape,
    this.borderSide,
  });

  final OnCheckBoxChange? onCheckBoxChange;
  final bool value;
  final BorderSide? borderSide;
  final OutlinedBorder? shape;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      shape: shape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(HoagSpacing.spacing15s),
          ),
      fillColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return HoagColors.primary;
          } else if (states.contains(WidgetState.disabled)) {
            return CoreColors.neutral01;
          } else {
            return CoreColors.transparent;
          }
        },
      ),
      side: borderSide ??
          BorderSide(
            color: HoagColors.secondary,
            width: 1.5,
          ),
      onChanged: onCheckBoxChange != null
          ? (value) {
              onCheckBoxChange!(value);
            }
          : null,
    );
  }
}
