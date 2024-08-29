import 'package:flutter/material.dart';

import '../../../hoagsource.dart';

class HoagItemRowTitle extends StatelessWidget {
  const HoagItemRowTitle({
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
            style: HoagTextStyle.bodySmall.applyColor(HoagColors.textSubtitle),
            textAlign: TextAlign.start,
          ),
        ),
        const SizedBox(
          width: HoagSpacing.spacing2,
        ),
        Expanded(
          flex: 3,
          child: Text(
            value,
            style: valueStyle ??
                HoagTextStyle.labelMedium.applyColor(HoagColors.textBody),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
          ),
        )
      ],
    );
  }
}
