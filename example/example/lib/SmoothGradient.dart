import 'package:flutter/material.dart';
import 'package:hoagsource/src/component/layout/smooth_gradient.dart';

class SmoothGradientAx extends StatelessWidget {
  const SmoothGradientAx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SmoothGradient'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: SmoothGradient(
            from: Colors.red,
            to: Colors.blue,
          ),
        ),
        child: const Center(
          child: Text('SmoothGradient'),
        ),
      ),
    );
  }
}
