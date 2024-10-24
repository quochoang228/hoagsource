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
              BaseDashedLine(contentWidget: const Text('content')),
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
            ],
          ),
        ),
      ),
    );
  }
}
