import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../hoagsource.dart';

enum BrnToastGravity {
  bottom,
  center,
  top,
}

class BrnDuration {
  BrnDuration._();

  static const Duration short = Duration(seconds: 1);

  static const Duration long = Duration(seconds: 3);
}

class HoagNormalToast {
  static const int _defaultTopOffset = 50;

  static const int _defaultBottomOffset = 50;

  static ToastView? preToastView;

  static void showInCenter({
    required String text,
    required BuildContext context,
    Duration? duration,
    Widget? preIcon,
  }) {
    show(
      text,
      context,
      duration: duration,
      preIcon: preIcon,
      gravity: BrnToastGravity.center,
    );
  }

  static void showSuccess(
      {required String text,
      required BuildContext context,
      Duration? duration}) {
    show(
      text,
      context,
      duration: duration,
      preIcon: SvgPicture.asset(
        HoagAssets.toastSuccess,
        package: HoagStrings.flutterPackageName,
      ),
      gravity: BrnToastGravity.center,
    );
  }

  static void showError(
      {required String text,
      required BuildContext context,
      Duration? duration}) {
    show(
      text,
      context,
      duration: duration,
      preIcon: SvgPicture.asset(
        HoagAssets.toastError,
        package: HoagStrings.flutterPackageName,
      ),
      gravity: BrnToastGravity.center,
    );
  }

  static void show(
    String text,
    BuildContext context, {
    Duration? duration,
    Color? background,
    TextStyle textStyle = const TextStyle(
      fontSize: 14,
      height: 1.43,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    double? radius,
    Widget? preIcon,
    double? verticalOffset,
    VoidCallback? onDismiss,
    BrnToastGravity? gravity,
  }) {
    final OverlayState overlayState = Overlay.of(context);

    preToastView?._dismiss();
    preToastView = null;

    final double finalVerticalOffset = getVerticalOffset(
      context: context,
      gravity: gravity,
      verticalOffset: verticalOffset,
    );

    final int autoDuration = min(text.length * 0.06 + 0.8, 5.0).ceil();
    final Duration finalDuration = duration ?? Duration(seconds: autoDuration);
    final OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) {
        return _ToastWidget(
          widget: ToastChild(
            background: background,
            radius: radius,
            msg: text,
            leading: preIcon,
            textStyle: textStyle,
            gravity: gravity,
            verticalOffset: finalVerticalOffset,
          ),
        );
      },
    );
    final ToastView toastView =
        ToastView(overlayState: overlayState, overlayEntry: overlayEntry);
    preToastView = toastView;
    toastView._show(
      duration: finalDuration,
      onDismiss: onDismiss,
    );
  }

  static double getVerticalOffset({
    required BuildContext context,
    BrnToastGravity? gravity,
    double? verticalOffset,
  }) {
    final double verticalOffset0 = verticalOffset ?? 0;
    final double defaultOffset;
    switch (gravity) {
      case BrnToastGravity.bottom:
        final offset = verticalOffset ?? _defaultBottomOffset;
        defaultOffset = MediaQuery.of(context).viewInsets.bottom + offset;
        break;
      case BrnToastGravity.top:
        final offset = verticalOffset ?? _defaultTopOffset;
        defaultOffset = MediaQuery.of(context).viewInsets.top + offset;
        break;
      case BrnToastGravity.center:
      default:
        defaultOffset = verticalOffset ?? 0;
    }

    return defaultOffset + verticalOffset0;
  }
}

class ToastView {
  OverlayState overlayState;
  OverlayEntry overlayEntry;
  bool _isVisible = false;

  ToastView({
    required this.overlayState,
    required this.overlayEntry,
  });

  void _show({required Duration duration, VoidCallback? onDismiss}) async {
    _isVisible = true;
    overlayState.insert(overlayEntry);
    Future.delayed(duration, () {
      _dismiss();
      onDismiss?.call();
    });
  }

  void _dismiss() async {
    if (!_isVisible) {
      return;
    }
    _isVisible = false;
    overlayEntry.remove();
  }
}

class ToastChild extends StatelessWidget {
  const ToastChild({
    super.key,
    required this.msg,
    required this.verticalOffset,
    this.background,
    this.radius,
    this.leading,
    this.gravity,
    this.textStyle,
  });

  Alignment get alignment {
    switch (gravity) {
      case BrnToastGravity.bottom:
        return Alignment.bottomCenter;
      case BrnToastGravity.top:
        return Alignment.topCenter;
      case BrnToastGravity.center:
      default:
        return Alignment.center;
    }
  }

  EdgeInsets get padding {
    switch (gravity) {
      case BrnToastGravity.bottom:
        return EdgeInsets.only(bottom: verticalOffset);
      case BrnToastGravity.top:
        return EdgeInsets.only(top: verticalOffset);
      case BrnToastGravity.center:
      default:
        return EdgeInsets.only(top: verticalOffset);
    }
  }

  final String msg;
  final double verticalOffset;
  final Color? background;
  final double? radius;
  final Widget? leading;
  final BrnToastGravity? gravity;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Container(
        padding: padding,
        alignment: alignment,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.15),
        child: Container(
          decoration: BoxDecoration(
            color: background ?? CoreColors.black.withOpacity(0.7),
            borderRadius: BorderRadius.circular(radius ?? HoagRadius.radiusMd),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.fromLTRB(
            HoagSpacing.spacing4,
            HoagSpacing.spacing6,
            HoagSpacing.spacing4,
            HoagSpacing.spacing6,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              leading ?? const SizedBox.shrink(),
              leading != null
                  ? const SizedBox(
                      height: HoagSpacing.spacing25,
                    )
                  : const SizedBox.shrink(),
              Text(
                msg,
                style: textStyle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          // child: Text.rich(
          //   TextSpan(children: <InlineSpan>[
          //     leadingSpan,
          //     TextSpan(text: msg, style: textStyle),
          //   ]),
          // ),
        ),
      ),
    );
  }
}

class _ToastWidget extends StatelessWidget {
  const _ToastWidget({
    required this.widget,
  });

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Material(color: Colors.transparent, child: widget),
    );
  }
}
