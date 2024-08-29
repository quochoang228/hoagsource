import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../hoagsource.dart';


class HoagErrorState extends StatelessWidget {
  const HoagErrorState({
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
          HoagAssets.stateError,
          package: HoagStrings.flutterPackageName,
          width: MediaQuery.sizeOf(context).width * 0.35,
          height: MediaQuery.sizeOf(context).width * 0.35,
        ),
        const Gap(HoagSpacing.spacing2),
        Text(
          title ?? '',
          style: HoagTextStyle.titleSmall,
        ),
        const Gap(HoagSpacing.spacing2),
        Text(
          msg ?? '',
          style: HoagTextStyle.captionLarge,
        ),
      ],
    );
  }
}
