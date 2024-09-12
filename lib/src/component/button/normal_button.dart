
import 'package:flutter/material.dart';

import '../../../hoagsource.dart';

const double _bFontSize = 16;
const Color _bTextColor = Colors.white;
const Color _bBackgroundColor = CoreColors.red;
const Color _bDisableBackgroundColor = CoreColors.neutral01;
const FontWeight _bFontWeight = FontWeight.bold;
const double _bRadius = BaseRadius.radiusMd;

/// Universal button that supports users to set attributes such as background color, availability, etc.
/// If [BrnBigMainButton], [BrnSmallMainButton], [BrnBigOutlineButton] cannot meet user needs
/// You can use this button directly
///
/// [isEnable] If set to false, the button will appear gray and the click event will not respond.
///
/// The [Text] text component is used by default, if the user wants to display other components. For example, pictures, etc., you can set the [child] attribute
///
/// The style attributes required by the text component can be set through [textStyle], or can be set individually through [fontSize], etc.
///
/// The layout rules of this component refer to the layout rules of [Container]
/// The [alignment] attribute of this component defaults to null, even if the constraints given by the parent layout are borderless (the maximum width or height is double.infinity.)
/// The size of the component will also be the same as the child.
/// That means: do not set a value for the [alignment] attribute, even if you put [BaseNormalButton] into [column] and [ListView],
/// He will also be as small as possible. If the [constraints] attribute is set, the layout will be Hoagd on [constraints].
///
/// Case number one
/// ```dart
/// BrnNormalButton(
/// text: 'The main case is particularly long',
/// onTap: () {
/// BrnToast.show('The main button was clicked', context);
/// },
/// )
/// ```
/// The size of the button is the size of the text + the size of the padding
///
///Case 2
/// ```dart
/// BrnNormalButton(
/// constraints: BoxConstraints.expand(height: 60),
/// text: 'The main case is particularly long',
/// onTap: () {
/// BrnToast.show('The main button was clicked', context);
/// },
/// )
/// ```
/// The size of the button: the width fills the parent layout and the height is 60
///
/// If [alignment] of the component is assigned a value, the constraints of the parent layout are bounded.
/// The size of this component is the constraint of the parent layout, and [text] or [child] will be placed according to the [alignment] attribute, such as placing it in the center.
///
/// Case number one
/// ```dart
/// BrnNormalButton(
/// alignment: Alignment.center,
/// text: 'The main case is particularly long',
/// onTap: () {
/// BrnToast.show('The main button was clicked', context);
/// },
/// )
/// ```
/// The size of the button: the width fills the parent layout and the text is centered
///
/// * [BrnBigMainButton], big main color button
/// * [BrnBigOutlineButton], big border button
/// * [BrnSmallMainButton], small main color button
/// * [BrnSmallOutlineButton], small border button
///
class BaseNormalButton extends StatelessWidget {
  /// 按钮是否可用 默认是true
  final bool isEnable;

  /// 按钮点击的回调
  final VoidCallback? onTap;

  /// 按钮显示的文案
  final String text;

  /// 按钮的文字颜色 默认白色[_bTextColor]
  final Color textColor;

  /// 按钮的文字大小 默认[_bFontSize]
  final double fontSize;

  /// 按钮不可用的文字颜色
  final Color? disableTextColor;

  /// 按钮背景色 默认[_bBackgroundColor]
  final Color backgroundColor;

  /// 按钮不可用背景色 默认[_bDisableBackgroundColor]
  final Color disableBackgroundColor;

  /// 按钮内边距 默认水平[_bHorizontalPadding] 垂直[_bVerticalPadding]
  final EdgeInsetsGeometry insertPadding;

  /// 按钮的修饰 默认实色背景
  final Decoration? decoration;

  /// 按钮的显示子节点 优先级高于[text]
  final Widget? child;

  /// 按钮的文本显示样式 优先级高于[textColor]等属性
  final TextStyle? textStyle;

  /// 按钮的文本Weight 默认是[FontWeight.bold]
  final FontWeight fontWeight;

  /// 按钮的布局约束 默认是自适应大小
  final BoxConstraints constraints;

  /// 按钮的内部对齐 默认为null
  final Alignment? alignment;

  /// 按钮圆角大小
  final BorderRadiusGeometry borderRadius;

  /// create BrnNormalButton
  const BaseNormalButton({
    super.key,
    required this.text,
    this.backgroundColor = _bBackgroundColor,
    this.isEnable = true,
    this.onTap,
    this.insertPadding = const EdgeInsets.symmetric(
      vertical: BaseSpacing.spacing3,
      horizontal: BaseSpacing.spacing25,
    ),
    this.decoration,
    this.child,
    this.textStyle,
    this.fontWeight = _bFontWeight,
    this.fontSize = _bFontSize,
    this.textColor = _bTextColor,
    this.disableTextColor,
    this.disableBackgroundColor = _bDisableBackgroundColor,
    this.constraints = const BoxConstraints.tightFor(),
    this.borderRadius = const BorderRadius.all(Radius.circular(_bRadius)),
    this.alignment,
  });

  BaseNormalButton.outline({
    super.key,
    Color? disableLineColor,
    Color? lineColor,
    double radius = 6,
    double borderWith = 1.0,
    required this.text,
    this.isEnable = true,
    this.backgroundColor = _bBackgroundColor,
    this.disableBackgroundColor = _bDisableBackgroundColor,
    this.alignment,
    this.child,
    this.onTap,
    this.textColor = _bTextColor,
    this.fontWeight = _bFontWeight,
    this.fontSize = _bFontSize,
    this.disableTextColor,
    this.insertPadding = const EdgeInsets.symmetric(
      vertical: BaseSpacing.spacing2,
      horizontal: BaseSpacing.spacing25,
    ),
    this.textStyle,
    this.constraints = const BoxConstraints.tightFor(),
    this.borderRadius = const BorderRadius.all(Radius.circular(_bRadius)),
  }) : decoration = _OutlineBoxDecorationCreator.createOutlineBoxDecoration(
            isEnable: isEnable,
            disableBackgroundColor: disableBackgroundColor,
            disableLineColor: disableLineColor,
            lineColor: lineColor,
            backgroundColor: backgroundColor,
            radius: radius,
            borderWith: borderWith);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (ClickUtils.isMultiClick()) {
          return;
        }
        if (isEnable && onTap != null) {
          onTap!();
        }
      },
      child: Container(
        alignment: alignment,
        decoration: decoration ?? _getBoxDecoration(_getBackgroundColor()),
        constraints: constraints,
        padding: insertPadding,
        child: Center(
          child: child ??
              Text(
                text,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: _getTextStyle(),
              ),
        ),
      ),
    );
  }

  TextStyle _getTextStyle() {
    if (textStyle != null) {
      return textStyle!;
    }

    return BaseTextStyle.labelLarge.copyWith(
      color: isEnable ? textColor : disableTextColor,
    );
  }

  Color _getBackgroundColor() {
    return isEnable ? backgroundColor : disableBackgroundColor;
  }

  BoxDecoration _getBoxDecoration(Color? bgColor) {
    return BoxDecoration(
      color: bgColor,
      borderRadius: borderRadius,
    );
  }
}

class _OutlineBoxDecorationCreator {
  static BoxDecoration createOutlineBoxDecoration({
    required bool isEnable,
    Color? disableLineColor,
    Color? lineColor,
    required Color backgroundColor,
    required Color disableBackgroundColor,
    double radius = 6,
    double borderWith = 1.0,
  }) {
    Color lineColor0 = isEnable ? lineColor! : disableLineColor!;
    Color bgColor = isEnable ? backgroundColor : disableBackgroundColor;

    return BoxDecoration(border: Border.all(color: lineColor0, width: borderWith), borderRadius: BorderRadius.all(Radius.circular(radius)), color: bgColor);
  }
}
