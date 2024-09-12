import 'package:flutter/material.dart';

import '../../../hoagsource.dart';

class BaseItemRowTitle extends StatelessWidget {
  const BaseItemRowTitle({
    super.key,
    required this.title,
    required this.value,
    this.valueStyle,
  });

  final String title;
  final String value;
  final TextStyle? valueStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            title,
            style: BaseTextStyle.bodySmall.applyColor(BaseColors.textSubtitle),
            textAlign: TextAlign.start,
          ),
        ),
        const SizedBox(
          width: BaseSpacing.spacing2,
        ),
        Expanded(
          flex: 3,
          child: Text(
            value,
            style: valueStyle ??
                BaseTextStyle.labelMedium.applyColor(BaseColors.textBody),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
          ),
        )
      ],
    );
  }
}
