import 'package:flutter/material.dart';

enum DashedLinePosition {
  trailing,
  leading,
}

const Axis _normalAxis = Axis.horizontal;

const double _normalDashedLength = 8;

const double _normalDashedThickness = 1;

const double _normalDashedSpacing = 4;

const DashedLinePosition _normalPosition = DashedLinePosition.leading;

class HoagDashedLine extends StatelessWidget {
  final Axis axis;

  final double dashedLength;

  final double dashedThickness;

  final double dashedSpacing;

  final Color? color;

  final Widget contentWidget;

  final double dashedOffset;

  final DashedLinePosition position;

  const HoagDashedLine({
    super.key,
    required this.contentWidget,
    this.axis = _normalAxis,
    this.dashedLength = _normalDashedLength,
    this.dashedThickness = _normalDashedThickness,
    this.dashedSpacing = _normalDashedSpacing,
    this.color,
    this.dashedOffset = 0.0,
    this.position = _normalPosition,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedPainter(
          axis: axis,
          dashedLength: dashedLength,
          dashedThickness: dashedThickness,
          dashedSpacing: dashedSpacing,
          color: color,
          dashedOffset: dashedOffset,
          position: position),
      child: contentWidget,
    );
  }
}

class DashedPainter extends CustomPainter {
  final Axis axis;

  final double dashedLength;

  final double dashedThickness;

  final double dashedSpacing;

  final Color? color;

  final double? dashedOffset;

  final DashedLinePosition? position;

  DashedPainter({
    this.axis = _normalAxis,
    this.dashedLength = _normalDashedLength,
    this.dashedThickness = _normalDashedThickness,
    this.dashedSpacing = _normalDashedSpacing,
    this.color,
    this.dashedOffset = 0.0,
    this.position = _normalPosition,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..strokeWidth = dashedThickness
      ..isAntiAlias = true
      ..color = color ?? Colors.grey;

    var maxWidth = size.width;
    var maxHeight = size.height;
    if (axis == Axis.horizontal) {
      double startX = 0;
      final space = (dashedSpacing + dashedLength);
      double height = 0;
      if (position == DashedLinePosition.leading) {
        height = dashedOffset! + dashedThickness / 2;
      } else {
        height = size.height - dashedOffset! - dashedThickness / 2;
      }
      while (startX < maxWidth) {
        if ((maxWidth - startX) < dashedLength) {
          canvas.drawLine(Offset(startX, height), Offset(startX + (maxWidth - startX), height), paint);
        } else {
          canvas.drawLine(Offset(startX, height), Offset(startX + dashedLength, height), paint);
        }
        startX += space;
      }
    } else {
      // 垂直方向
      double startY = 0;
      final space = (dashedSpacing + dashedLength);
      double width = 0;
      if (position == DashedLinePosition.leading) {
        // 头部
        width = dashedOffset! + dashedThickness / 2;
      } else {
        // 尾部
        width = size.width - dashedOffset! - dashedThickness / 2;
      }
      while (startY < maxHeight) {
        if ((maxHeight - startY) < dashedLength) {
          canvas.drawLine(Offset(width, startY), Offset(width, startY + (maxHeight - startY)), paint);
        } else {
          canvas.drawLine(Offset(width, startY), Offset(width, startY + dashedLength), paint);
        }
        startY += space;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
