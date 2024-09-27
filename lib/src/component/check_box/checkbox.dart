import 'package:flutter/material.dart';

import '../../../hoagsource.dart';

typedef OnCheckBoxChange<bool> = bool Function(bool value);

class BaseCheckBox extends StatelessWidget {
  const BaseCheckBox({
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
            borderRadius: BorderRadius.circular(BaseSpacing.spacing15s),
          ),
      fillColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.selected)) {
            return BaseColors.primary;
          } else if (states.contains(MaterialState.disabled)) {
            return CoreColors.neutral01;
          } else {
            return CoreColors.transparent;
          }
        },
      ),
      side: borderSide ??
          BorderSide(
            color: BaseColors.secondary,
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
