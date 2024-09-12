import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../hoagsource.dart';

class BaseListLoading extends StatelessWidget {
  const BaseListLoading({
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
            color: BaseColors.backgroundWhite,
          ),
          padding: const EdgeInsets.symmetric(
              vertical: BaseSpacing.spacing2, horizontal: BaseSpacing.spacing3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BaseSkeletonWrapper(
                child: Container(
                  height: size.height * 0.04,
                  width: size.width * 0.6,
                  decoration: BoxDecoration(
                    color: BaseColors.backgroundGray1,
                    borderRadius: BorderRadius.circular(BaseRadius.radiusSm),
                  ),
                ),
              ),
              const Gap(BaseSpacing.spacing2),
              BaseSkeletonWrapper(
                child: Container(
                  height: BaseSpacing.spacing4,
                  decoration: BoxDecoration(
                    color: BaseColors.backgroundGray1,
                    borderRadius: BorderRadius.circular(BaseRadius.radiusSm),
                  ),
                ),
              ),
              const Gap(BaseSpacing.spacing2),
              BaseSkeletonWrapper(
                child: Container(
                  height: BaseSpacing.spacing4,
                  decoration: BoxDecoration(
                    color: BaseColors.backgroundGray1,
                    borderRadius: BorderRadius.circular(BaseRadius.radiusSm),
                  ),
                ),
              ),
              const Gap(BaseSpacing.spacing2),
              BaseSkeletonWrapper(
                child: Container(
                  height: BaseSpacing.spacing4,
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: BaseColors.backgroundGray1,
                    borderRadius: BorderRadius.circular(BaseRadius.radiusSm),
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
      separatorBuilder: (context, index) => const Gap(BaseSpacing.spacing05),
      itemCount: 3,
    );
  }
}
