import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TouchTargetPadding extends SingleChildRenderObjectWidget {
  final Size minSize;

  const TouchTargetPadding({super.key, super.child, required this.minSize});

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderTouchTargetPadding(minSize);
  }

  @override
  void updateRenderObject(
      BuildContext context,
      covariant RenderTouchTargetPadding renderObject,
      ) {
    renderObject.minSize = minSize;
  }
}

class RenderTouchTargetPadding extends RenderShiftedBox {
  Size _minSize;

  RenderTouchTargetPadding(this._minSize, [RenderBox? child]) : super(child);

  Size get minSize => _minSize;

  set minSize(Size value) {
    if (_minSize != value) {
      _minSize = value;
      markNeedsLayout();
    }
  }

  @override
  double computeMinIntrinsicWidth(double height) => child != null
      ? math.max(child!.getMinIntrinsicWidth(height), minSize.width)
      : 0.0;

  @override
  double computeMinIntrinsicHeight(double width) => child != null
      ? math.max(child!.getMinIntrinsicHeight(width), minSize.height)
      : 0.0;

  @override
  double computeMaxIntrinsicWidth(double height) => child != null
      ? math.max(child!.getMaxIntrinsicWidth(height), minSize.width)
      : 0.0;

  @override
  double computeMaxIntrinsicHeight(double width) => child != null
      ? math.max(child!.getMaxIntrinsicHeight(width), minSize.height)
      : 0.0;

  Size _computeSize({
    required BoxConstraints constraints,
    required ChildLayouter layoutChild,
  }) {
    if (child != null) {
      final Size childSize = layoutChild(child!, constraints);
      final double height = math.max(childSize.width, minSize.width);
      final double width = math.max(childSize.height, minSize.height);
      return constraints.constrain(Size(height, width));
    }
    return Size.zero;
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    return _computeSize(
      constraints: constraints,
      layoutChild: ChildLayoutHelper.dryLayoutChild,
    );
  }

  @override
  void performLayout() {
    size = _computeSize(
      constraints: constraints,
      layoutChild: ChildLayoutHelper.layoutChild,
    );
    if (child != null) {
      final BoxParentData childParentData = child!.parentData! as BoxParentData;
      childParentData.offset =
          Alignment.center.alongOffset(size - child!.size as Offset);
    }
  }

  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    if (super.hitTest(result, position: position)) return true;

    final Offset center = child!.size.center(Offset.zero);

    return result.addWithRawTransform(
      transform: MatrixUtils.forceToPoint(center),
      position: center,
      hitTest: (BoxHitTestResult result, Offset position) {
        assert(position == center);
        return child!.hitTest(result, position: center);
      },
    );
  }
}