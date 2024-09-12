import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../hoagsource.dart';

class BaseSelectedView extends StatelessWidget {
  const BaseSelectedView({
    super.key,
    required this.child,
    this.isSelected,
    this.onTap,
  });

  final Widget child;
  final bool? isSelected;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap != null
          ? () {
              onTap!();
            }
          : null,
      child: Container(
        padding: const EdgeInsets.all(BaseSpacing.spacing4),
        decoration: BoxDecoration(
          color: BaseColors.backgroundWhite,
          border: Border(
            bottom: BorderSide(
              color: BaseColors.borderDivider,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(child: child),
            isSelected ?? false
                ? SvgPicture.asset(
                    BaseAssets.tickCircle,
                    package: BaseStrings.flutterPackageName,
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
