import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../hoagsource.dart';

class HoagSelectedView extends StatelessWidget {
  const HoagSelectedView({
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
        padding: const EdgeInsets.all(HoagSpacing.spacing4),
        decoration: BoxDecoration(
          color: HoagColors.backgroundWhite,
          border: Border(
            bottom: BorderSide(
              color: HoagColors.borderDivider,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(child: child),
            isSelected ?? false
                ? SvgPicture.asset(
                    HoagAssets.tickCircle,
                    package: HoagStrings.flutterPackageName,
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
