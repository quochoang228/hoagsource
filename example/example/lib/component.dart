import 'package:flutter/material.dart';
import 'package:hoagsource/hoagsource.dart';

class Component extends StatefulWidget {
  const Component({super.key});

  @override
  State<Component> createState() => _ComponentState();
}

class _ComponentState extends State<Component> {
  var checkBoxValue = false;
  int progress = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Component'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Button',
                style: BaseTextStyle.headlineLarge,
              ),
              const SizedBox(height: 8),
              BaseSolidButton(label: 'label', onPressed: () {}),
              const SizedBox(height: 8),
              BaseGhostButton(label: 'label', onPressed: () {}),
              const SizedBox(height: 8),
              BaseTextButton(
                label: 'label',
                onPressed: () {},
              ),
              const SizedBox(height: 8),
              const BaseDivider(),
              const SizedBox(height: 8),
              BaseCheckBox(
                  onCheckBoxChange: (value) {
                    setState(() {
                      checkBoxValue = value;
                    });
                  },
                  value: checkBoxValue),
              const BaseIcon(BaseIcons.icon1, style: BaseIconStyle.solid),
              const BaseText(content: 'content'),
              const BaseDashedLine(contentWidget: Text('content')),
              CircularAnimatedProgressBar(
                  size: 150,
                  progress: (progress.clamp(0, 10) / 10),
                  onPressed: () {
                    setState(() {
                      progress += 2;
                    });
                  }),
              RectangleAnimatedProgressBar(
                progress: (progress.clamp(0, 10) / 10),
                enumPosition: PositionEnum.right,
                colorsWave: const [
                  Color(0x4D2196f3),
                  Color(0x662196f3),
                  Color(0xCC2196f3),
                ],
                backgroundColor: const Color(0x262192F3),
              ),
              const SizedBox(height: 8),
              const BaseAccordion(
                label: Text('data'),
                childrenPadding: EdgeInsets.all(16),
                accordionSize: BaseAccordionSize.lg,
                children: [
                  Text(
                      'Lorem ipsum dolor sit amet consectetur. Facilisi sagittis elementum lacus egestas vitae id tortor. Duis arcu orci aliquet diam montes'),
                ],
              ),
              const SizedBox(height: 8),
              BaseAlert(
                label: const Text(
                    'Because of your contributions on GitHub, two-factor authentication is required for your account.'),
                backgroundColor: BaseTokenColors.light.heles,
                leading: const BaseIcon(BaseIcons.information),
                color: CoreColors.blue,
              ),
              const SizedBox(height: 8),
              BaseAlert(
                label: const Text(
                    'Because of your contributions on GitHub, two-factor authentication is required for your account.'),
                borderColor: BaseTokenColors.light.bulma,
                showBorder: true,
                backgroundColor: CoreColors.transparent,
                leading: const BaseIcon(BaseIcons.information),
                color: CoreColors.blue,
              ),
              const SizedBox(height: 8),
              const BaseAccordion<String>(
                // The identityValue and groupIdentityValue can be used to control the
                // auto collapse behaviour of the accordion.
                identityValue: 'collapse behaviour of the accordion',
                groupIdentityValue: "_currentlyOpenAccordionItem",
                accordionSize: BaseAccordionSize.sm,
                hasContentOutside: true,
                childrenPadding: EdgeInsets.all(12),
                // onExpansionChanged: (String? value) => setState(
                //   () => _currentlyOpenAccordionItem = value,
                // ),
                leading: BaseIcon(BaseIcons.dash),
                label: Text("Grouped MoonAccordion item #2"),
                children: [
                  Text(
                      'Lorem ipsum dolor sit amet consectetur. Facilisi sagittis elementum lacus egestas vitae id tortor. Duis arcu orci aliquet diam montes'),
                ],
                // children: const [
                //   Text(contentText),
                // ],
              ),
              const SizedBox(height: 188),
              BaseAuthCode(
                validator: (value) {
                  if (value != null && !(value.isNumeric)) {
                    return "Định dạng sai";
                  }
                  return null;
                },
                errorBuilder: (context, errorText) => Text(errorText ?? ''),
              ),
              const SizedBox(height: 188),
            ],
          ),
        ),
      ),
    );
  }
}
