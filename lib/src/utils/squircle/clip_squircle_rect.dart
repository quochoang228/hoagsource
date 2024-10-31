import 'package:flutter/widgets.dart';
import 'package:hoagsource/hoagsource.dart';


class MoonClipSquircleRect extends StatelessWidget {
  final BaseSquircleBorderRadius radius;
  final Clip clipBehavior;
  final Widget? child;

  const MoonClipSquircleRect({
    super.key,
    required this.child,
    this.radius = BaseSquircleBorderRadius.zero,
    this.clipBehavior = Clip.antiAlias,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath.shape(
      clipBehavior: clipBehavior,
      shape: BaseSquircleBorder(
        borderRadius: radius,
      ),
      child: child,
    );
  }
}
