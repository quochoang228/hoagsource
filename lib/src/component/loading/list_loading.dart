import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../hoagsource.dart';

class HoagListLoading extends StatelessWidget {
  const HoagListLoading({
    super.key,
    this.padding = EdgeInsets.zero,
  });

  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return ListView.separated(
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(HoagRadius.radiusMd),
            color: HoagColors.backgroundWhite,
          ),
          padding: const EdgeInsets.symmetric(
              vertical: HoagSpacing.spacing2, horizontal: HoagSpacing.spacing3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HoagSkeletonWrapper(
                child: Container(
                  height: size.height * 0.04,
                  width: size.width * 0.6,
                  decoration: BoxDecoration(
                    color: HoagColors.backgroundGray1,
                    borderRadius: BorderRadius.circular(HoagRadius.radiusSm),
                  ),
                ),
              ),
              const Gap(HoagSpacing.spacing2),
              HoagSkeletonWrapper(
                child: Container(
                  height: HoagSpacing.spacing4,
                  decoration: BoxDecoration(
                    color: HoagColors.backgroundGray1,
                    borderRadius: BorderRadius.circular(HoagRadius.radiusSm),
                  ),
                ),
              ),
              const Gap(HoagSpacing.spacing2),
              HoagSkeletonWrapper(
                child: Container(
                  height: HoagSpacing.spacing4,
                  decoration: BoxDecoration(
                    color: HoagColors.backgroundGray1,
                    borderRadius: BorderRadius.circular(HoagRadius.radiusSm),
                  ),
                ),
              ),
              const Gap(HoagSpacing.spacing2),
              HoagSkeletonWrapper(
                child: Container(
                  height: HoagSpacing.spacing4,
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: HoagColors.backgroundGray1,
                    borderRadius: BorderRadius.circular(HoagRadius.radiusSm),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: padding,
      separatorBuilder: (context, index) => const Gap(HoagSpacing.spacing05),
      itemCount: 3,
    );
  }
}
