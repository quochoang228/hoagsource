import 'package:flutter/material.dart';
import 'dart:math' show pi, sin;

class BreathingAnimation extends StatefulWidget {
  const BreathingAnimation({super.key});

  @override
  _BreathingAnimationState createState() => _BreathingAnimationState();
}

class _BreathingAnimationState extends State<BreathingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 4000),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D224F),
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Stack(
            children: [
              Positioned(
                top: 80,
                left: 0,
                right: 0,
                child: Text(
                  _animation.value < 0.5 ? "Expirez" : "Inspirez",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CustomPaint(
                painter: BreathingPainter(_animation.value),
                size: Size.infinite,
              ),
            ],
          );
        },
      ),
    );
  }
}

class BreathingPainter extends CustomPainter {
  final double progress;

  BreathingPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    final maxHeight = height * 0.7;
    final minHeight = height * 0.2;
    final currentHeight =
        minHeight + (maxHeight - minHeight) * (0.5 + 0.5 * sin(progress * pi));
    final topY = height - currentHeight;

    final path = Path()
      ..moveTo(0, height)
      ..lineTo(0, topY)
      ..quadraticBezierTo(
          width / 2, topY - (maxHeight - minHeight) * 0.2, width, topY)
      ..lineTo(width, height)
      ..close();

    final paint = Paint()..color = const Color(0xFFFF9800);
    canvas.drawPath(path, paint);

    _drawFace(canvas, size, topY, progress);
  }

  void _drawFace(Canvas canvas, Size size, double blobTopY, double progress) {
    final width = size.width;
    final faceY = blobTopY;
    final eyeWidth = width * 0.1;
    final eyeHeight = eyeWidth * 0.5;
    final mouthWidth = width * 0.4;
    const faceColor = Color(0xFF4A4A4A);
    const strokeWidth = 10.0;

    final facePaint = Paint()
      ..color = faceColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    // Left eye
    canvas.drawArc(
      Rect.fromLTWH(width * 0.35, faceY + eyeHeight, eyeWidth, eyeHeight * 2),
      0,
      pi,
      false,
      facePaint,
    );

    // Right eye
    canvas.drawArc(
      Rect.fromLTWH(
          width * 0.65 - eyeWidth, faceY + eyeHeight, eyeWidth, eyeHeight * 2),
      0,
      pi,
      false,
      facePaint,
    );

    // Smile
    final smileProgress = sin(progress * pi);
    final smileHeight = 60 * (1 + smileProgress);
    final smileWidth = mouthWidth * (0.5 + 0.5 * smileProgress);
    canvas.drawArc(
      Rect.fromLTWH(width * 0.5 - smileWidth / 2, faceY + eyeHeight * 4,
          smileWidth, smileHeight),
      0,
      pi,
      false,
      facePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}