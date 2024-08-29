import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../hoagsource.dart';

class WarningBottomSheetView extends StatelessWidget {
  final Widget? icon;
  final bool isShowIcon;
  final String? title;
  final String? description;
  final String? primaryButtonLabel; // return false value
  final VoidCallback? primaryOnPressed;
  final String? secondaryButtonLabel; // return true value
  final ButtonStyle? secondaryButtonStyle;
  final VoidCallback? secondaryOnPressed;
  final String? textButtonLabel;
  final VoidCallback? textButtonOnPressed;
  final String? tertiaryButtonLabel;
  final VoidCallback? tertiaryButtonOnPressed;

  const WarningBottomSheetView({
    super.key,
    this.icon,
    this.isShowIcon = true,
    this.title,
    this.description,
    this.primaryButtonLabel,
    this.primaryOnPressed,
    this.secondaryButtonLabel,
    this.secondaryButtonStyle,
    this.secondaryOnPressed,
    this.textButtonLabel,
    this.textButtonOnPressed,
    this.tertiaryButtonLabel,
    this.tertiaryButtonOnPressed,
  })  : assert(
            icon != null ||
                title != null ||
                description != null ||
                primaryButtonLabel != null ||
                secondaryButtonLabel != null ||
                textButtonLabel != null ||
                tertiaryButtonLabel != null,
            'Require at least one field to enable bottom sheet'),
        // Assert on primary button
        assert(primaryButtonLabel == null || primaryOnPressed != null,
            'primaryOnPressed can not be null'),
        assert(secondaryButtonLabel == null || secondaryOnPressed != null,
            'secondaryOnPressed can not be null'),
        assert(textButtonLabel == null || textButtonOnPressed != null,
            'textButtonOnPressed can not be null'),
        assert(tertiaryButtonLabel == null || tertiaryButtonOnPressed != null,
            'tertiaryButtonOnPressed can not be null');

  @override
  Widget build(BuildContext context) {
    List<Widget> modalContent = [];
    List<Widget> buttonGroup = [];

    Widget button;
    // Icon configuration
    if (title != null) {
      modalContent.add(
        Padding(
          padding: const EdgeInsets.only(bottom: HoagSpacing.spacing1),
          child: Text(
            title!,
            style: HoagTextStyle.headlineLarge,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
    if (description != null) {
      modalContent.add(Text(
        description!,
        style: HoagTextStyle.bodySmall.applyColor(HoagColors.textSubtitle),
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
        textAlign: TextAlign.center,
      ));
    }
    // if (icon != null) {
    //   Widget iconContent = Padding(
    //     padding: const EdgeInsets.only(bottom: HoagSpacing.spacing6),
    //     child: icon,
    //   );
    //   modalContent.insert(0, iconContent);
    // }
    if (isShowIcon) {
      Widget iconContent = Padding(
        padding: const EdgeInsets.only(bottom: HoagSpacing.spacing6),
        child: icon ??
            SvgPicture.asset(
              HoagAssets.circleWarning,
              package: HoagStrings.flutterPackageName,
            ),
      );
      modalContent.insert(0, iconContent);
    }
    // Button Configuration
    if (primaryButtonLabel != null) {
      button = Padding(
        padding: const EdgeInsets.only(bottom: HoagSpacing.spacing4),
        child: HoagSolidButton(
          label: primaryButtonLabel ?? '',
          onPressed: () {
            primaryOnPressed!();
          },
        ),
      );
      buttonGroup.add(button);
    }
    if (secondaryButtonLabel != null) {
      button = Padding(
        padding: const EdgeInsets.only(bottom: HoagSpacing.spacing4),
        child: HoagSolidButton.secondary(
          style: secondaryButtonStyle,
          label: secondaryButtonLabel ?? '',
          onPressed: () {
            secondaryOnPressed!();
          },
        ),
      );
      buttonGroup.add(button);
    }
    if (textButtonLabel != null) {
      button = Padding(
        padding: const EdgeInsets.only(bottom: HoagSpacing.spacing4),
        child: HoagTextButton(
          label: textButtonLabel ?? '',
          onPressed: () {
            textButtonOnPressed!();
          },
        ),
      );
      buttonGroup.add(button);
    }
    if (tertiaryButtonLabel != null) {
      button = Padding(
        padding: const EdgeInsets.only(bottom: HoagSpacing.spacing4),
        child: HoagTextButton(
          label: tertiaryButtonLabel ?? '',
          onPressed: () {
            tertiaryButtonOnPressed!();
          },
        ),
      );
      buttonGroup.add(button);
    }
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(HoagSpacing.spacing8),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: modalContent +
                [const SizedBox(height: HoagSpacing.spacing6)] +
                buttonGroup),
      ),
    );
  }
}
