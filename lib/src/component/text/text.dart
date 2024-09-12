import 'package:flutter/material.dart';

import '../../../hoagsource.dart';

class BaseText extends StatelessWidget {
  const BaseText({
    super.key,
    required this.content,
    this.style,
    this.requireStyle,
    // this.textAlign,
    // this.overflow,
    // this.maxLines,
    this.required = false,
  });

  final String content;
  final TextStyle? style;
  final TextStyle? requireStyle;

  // final TextAlign? textAlign;
  // final TextOverflow? overflow;
  // final int? maxLines;
  final bool required;

  @override
  Widget build(BuildContext context) {
    // return Text(
    //   content,
    //   style: style ?? BaseStyle.bodyMedium,
    //   textAlign: textAlign,
    //   overflow: overflow,
    //   maxLines: maxLines,
    // );
    return Text.rich(
      TextSpan(
        style: style ?? BaseTextStyle.bodyMedium,
        // textAlign: textAlign,
        // overflow: overflow,
        // maxLines: maxLines,
        text: content,
        children: <TextSpan>[
          if (required) ...[
            TextSpan(
              text: ' * ',
              style: requireStyle ??
                  BaseTextStyle.bodyMedium.applyColor(BaseColors.primary),
            ),
          ],
        ],
      ),
    );
  }
}
