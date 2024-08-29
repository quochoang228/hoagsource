import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../hoagsource.dart';

typedef TextExpandedCallback = Function(bool);

class HoagExpandableText extends StatefulWidget {
  final String text;

  final int? maxLines;

  final TextStyle? textStyle;
  final TextExpandedCallback? onExpanded;
  final Color? color;

  const HoagExpandableText(
      {super.key,
      required this.text,
      this.maxLines = 1000000,
      this.textStyle,
      this.onExpanded,
      this.color});

  @override
  HoagExpandableTextState createState() => HoagExpandableTextState();
}

class HoagExpandableTextState extends State<HoagExpandableText> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    TextStyle style = _defaultTextStyle();
    return LayoutBuilder(
      builder: (context, size) {
        final span = TextSpan(text: widget.text, style: style);
        final tp = TextPainter(
            text: span,
            maxLines: widget.maxLines,
            textDirection: TextDirection.ltr,
            ellipsis: 'EllipseText');
        tp.layout(maxWidth: size.maxWidth);
        if (tp.didExceedMaxLines) {
          if (_expanded) {
            return _expandedText(context, widget.text);
          } else {
            return _foldedText(context, widget.text);
          }
        } else {
          return _regularText(widget.text, style);
        }
      },
    );
  }

  Widget _foldedText(context, String text) {
    return Stack(
      children: <Widget>[
        Text(
          widget.text,
          style: _defaultTextStyle(),
          maxLines: widget.maxLines,
          overflow: TextOverflow.clip,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: _clickExpandTextWidget(context),
        )
      ],
    );
  }

  Widget _clickExpandTextWidget(context) {
    Color btnColor = widget.color ?? Colors.white;

    Text tx = Text(
      'Xem thêm...',
      style: HoagTextStyle.captionVeryLarge.copyWith(
        color: HoagColors.primary,
      ),
    );
    Container cnt = Container(
      padding: const EdgeInsets.only(left: 22),
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [btnColor.withAlpha(100), btnColor, btnColor],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      )),
      child: tx,
    );
    return GestureDetector(
      child: cnt,
      onTap: () {
        setState(() {
          _expanded = true;
          if (null != widget.onExpanded) {
            widget.onExpanded!(_expanded);
          }
        });
      },
    );
  }

  Widget _expandedText(context, String text) {
    return RichText(
      text: TextSpan(text: text, style: _defaultTextStyle(), children: [
        _foldButtonSpan(context),
      ]),
      textScaler: TextScaler.linear(
        MediaQuery.of(context).textScaler.scale(14),
      ),
    );
  }

  TextStyle _defaultTextStyle() {
    TextStyle style = widget.textStyle ?? HoagTextStyle.bodyMedium;
    return style;
  }

  InlineSpan _foldButtonSpan(context) {
    return TextSpan(
        text: ' ' 'Thu gọn',
        style: TextStyle(
          color: HoagColors.primary,
          fontSize: 14,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            setState(() {
              _expanded = false;
              if (null != widget.onExpanded) {
                widget.onExpanded!(_expanded);
              }
            });
          });
  }

  Widget _regularText(text, style) {
    return Text(text, style: style);
  }
}
