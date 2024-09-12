import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../hoagsource.dart';


class BaseErrorState extends StatelessWidget {
  const BaseErrorState({
    super.key,
    this.title,
    this.msg,
  });

  final String? title;
  final String? msg;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          BaseAssets.stateError,
          package: BaseStrings.flutterPackageName,
          width: MediaQuery.sizeOf(context).width * 0.35,
          height: MediaQuery.sizeOf(context).width * 0.35,
        ),
        const Gap(BaseSpacing.spacing2),
        Text(
          title ?? '',
          style: BaseTextStyle.titleSmall,
        ),
        const Gap(BaseSpacing.spacing2),
        Text(
          msg ?? '',
          style: BaseTextStyle.captionLarge,
        ),
      ],
    );
  }
}
