import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hoagsource/hoagsource.dart';
import 'package:hoagsource/src/component/animation_respiration.dart';

import 'SmoothGradient.dart';
import 'component.dart';
import 'icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      home: const MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: const Text('Icons'),
              leading: const BaseIcon(BaseIcons.icon1, style: BaseIconStyle.solid,),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ExIcons()),
                );
              },
            ),

            ListTile(
              title: const Text('Component'),
              leading: const BaseIcon(BaseIcons.component, style: BaseIconStyle.solid,),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Component()),
                );
              },
            ),
            ListTile(
              title: const Text('BreathingAnimation'),
              leading: const BaseIcon(BaseIcons.component, style: BaseIconStyle.solid,),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BreathingAnimation()),
                );
              },
            ),
            ListTile(
              title: const Text('SmoothGradient'),
              leading: const BaseIcon(BaseIcons.moon, style: BaseIconStyle.solid,),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SmoothGradientAx()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


class WeightMeasurementScreen extends StatelessWidget {
  const WeightMeasurementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weight Measurement'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Large, bold weight value
            Text(
              '24252',
              style: TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Units (e.g., "kg")
            const Text(
              'kg',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            // Circular progress bar with needle
            SizedBox(
              height: 200,
              width: 200,
              child: Stack(
                children: [
                  // Circular track
                  CircularProgressIndicator(
                    value: 0.75, // Adjust based on weight range
                    strokeWidth: 10,
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                  // Needle
                  Transform.rotate(
                    angle: 2 * pi * 0.75, // Adjust based on weight
                    child: CustomPaint(
                      painter: NeedlePainter(),
                    ),
                  ),
                ],
              ),
            ),
            // Buttons for actions (e.g., "Save", "Share")
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle "Save" action
                  },
                  child: const Text('Save'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle "Share" action
                  },
                  child: const Text('Share'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NeedlePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2;

    // Calculate needle position based on weight value
    final needleLength = size.height * 0.8;
    const needleAngle = 2 * pi * 0.25; // Adjust based on weight

    final needlePath = Path();
    needlePath.moveTo(size.width / 2, size.height / 2);
    needlePath.lineTo(size.width / 2 + needleLength * cos(needleAngle), size.height / 2 - needleLength * sin(needleAngle));

    canvas.drawPath(needlePath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}