import 'package:flutter/material.dart';
import 'package:hoagsource/hoagsource.dart';

class ExIcons extends StatefulWidget {
  const ExIcons({super.key});

  @override
  State<ExIcons> createState() => _ExIconsState();
}

class _ExIconsState extends State<ExIcons> {

  var baseIconStyle = BaseIconStyle.solid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Icons'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: BaseSolidButton(
                    label: 'Solid',
                    onPressed: () {
                      setState(() {
                        baseIconStyle = BaseIconStyle.solid;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: BaseGhostButton(
                    label: 'Outline',
                    onPressed: () {
                      setState(() {
                        baseIconStyle = BaseIconStyle.outline;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          const BaseDivider(),
          Text('Total : ${BaseIcons.values.length} icons',),
          Expanded(
            child: GridView(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1,
              ),
              children: List.generate(BaseIcons.values.length, (index) {
                return Column(
                  children: [
                    BaseIcon(
                      BaseIcons.values[index],
                      style: baseIconStyle,
                    ),
                    Text(
                      BaseIcons.values[index].name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
