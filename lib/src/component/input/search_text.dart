// import 'package:base_ui/base_ui.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/svg.dart';

// import '../../constants/assets.dart';
// import '../../constants/string.dart';

// typedef BrnOnSearchTextChange = void Function(String content);

// typedef BrnOnCommit = void Function(String content);

// typedef BrnOnTextClear = bool Function();

// class BaseSearchText extends StatefulWidget {
//   final String? hintText;

//   final TextStyle? hintStyle;

//   final TextStyle? textStyle;

//   final Widget? prefixIcon;

//   final Color outSideColor;

//   final Color innerColor;

//   final int maxLines;

//   final int? maxLength;

//   final double maxHeight;

//   final EdgeInsets innerPadding;

//   final BoxBorder? normalBorder;

//   final BoxBorder? activeBorder;

//   final BorderRadius borderRadius;

//   final Widget? action;

//   final bool autoFocus;

//   final TextInputAction? textInputAction;

//   final TextInputType? textInputType;

//   final List<TextInputFormatter>? inputFormatters;

//   final TextEditingController? controller;
//   final FocusNode? focusNode;

//   final BrnOnSearchTextChange? onTextChange;

//   final BrnOnCommit? onTextCommit;

//   final VoidCallback? onActionTap;

//   final BrnOnTextClear? onTextClear;

//   final BaseSearchTextController? searchController;

//   const BaseSearchText({
//     super.key,
//     this.searchController,
//     this.controller,
//     this.maxLines = 1,
//     this.maxLength,
//     this.hintText,
//     this.hintStyle,
//     this.textStyle,
//     this.prefixIcon,
//     this.onTextChange,
//     this.onTextCommit,
//     this.onTextClear,
//     this.onActionTap,
//     this.action,
//     this.maxHeight = 60,
//     this.innerPadding = const EdgeInsets.symmetric(vertical: BaseSpacing.spacing2, horizontal: BaseSpacing.spacing4),
//     this.outSideColor = CoreColors.white,
//     this.innerColor = CoreColors.white,
//     this.normalBorder,
//     this.activeBorder,
//     this.borderRadius = const BorderRadius.all(Radius.circular(BaseSpacing.spacing25)),
//     this.focusNode,
//     this.autoFocus = false,
//     this.textInputAction,
//     this.inputFormatters,
//     this.textInputType,
//   });

//   @override
//   State<StatefulWidget> createState() {
//     return _SearchTextState();
//   }
// }

// class _SearchTextState extends State<BaseSearchText> {
//   FocusNode? focusNode;
//   TextEditingController? textEditingController;
//   BoxBorder? border;
//   BaseSearchTextController? searchTextController;

//   BaseSearchTextController? tmpController;

//   @override
//   void initState() {
//     super.initState();

//     if (widget.searchController == null) {
//       tmpController = BaseSearchTextController();
//     }
//     searchTextController = widget.searchController ?? tmpController;
//     searchTextController!.addListener(() {
//       if (mounted) {
//         setState(() {});
//       }
//     });
//     focusNode = widget.focusNode ?? FocusNode();
//     textEditingController = widget.controller ?? TextEditingController();
//     border = widget.normalBorder ??
//         Border.all(
//           width: 1.0,
//           color: widget.innerColor,
//         );

//     focusNode!.addListener(_handleFocusNodeChangeListenerTick);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     tmpController?.dispose();
//     focusNode!.removeListener(_handleFocusNodeChangeListenerTick);
//   }

//   void _handleFocusNodeChangeListenerTick() {
//     if (focusNode!.hasFocus) {
//       border = widget.activeBorder ?? border;
//     } else {
//       border = widget.normalBorder ?? border;
//     }
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // padding: widget.innerPadding,
//       // color: widget.outSideColor,
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           Expanded(
//             child: TextField(
//               maxLength: widget.maxLength,
//               autofocus: widget.autoFocus,
//               textInputAction: widget.textInputAction,
//               focusNode: focusNode,
//               controller: textEditingController,
//               keyboardType: widget.textInputType,
//               inputFormatters: widget.inputFormatters,
//               cursorColor: BaseColors.primary,
//               cursorWidth: 2.0,
//               style: widget.textStyle ?? BaseStyle.bodyMedium.applyColor(BaseColors.textBody),
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: widget.borderRadius,
//                   borderSide: BorderSide(
//                     color: BaseColors.borderDefault,
//                     width: 1,
//                   ),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: widget.borderRadius,
//                   borderSide: BorderSide(
//                     color: BaseColors.borderFocus,
//                     width: 1,
//                   ),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: widget.borderRadius,
//                   borderSide: BorderSide(
//                     color: BaseColors.borderDefault,
//                     width: 1,
//                   ),
//                 ),
//                 contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16).copyWith(left: 0),
//                 fillColor: widget.innerColor,
//                 isDense: true,
//                 filled: true,
//                 hintStyle: widget.hintStyle ?? BaseStyle.bodyMedium.applyColor(BaseColors.textPlaceholder),
//                 hintText: widget.hintText ?? BaseStrings.searchHintText,
//                 counterText: '',
//                 prefixIcon: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                   child: widget.prefixIcon ??
//                       SvgPicture.asset(
//                         Assets.search,
//                         package: BaseStrings.flutterPackageName,
//                       ),
//                 ),
//                 suffixIcon: Visibility(
//                   visible: searchTextController!.isClearShow,
//                   replacement: const SizedBox(),
//                   child: GestureDetector(
//                     onTap: () {
//                       if (widget.onTextClear != null) {
//                         bool isIntercept = widget.onTextClear!();
//                         if (isIntercept) return;
//                       }
//                       textEditingController!.clear();
//                       if (widget.onTextChange != null) {
//                         widget.onTextChange!(textEditingController!.value.text);
//                       }
//                       setState(() {});
//                     },
//                     child: Visibility(
//                       visible: textEditingController!.text.isNotEmpty,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                         child: SvgPicture.asset(
//                           Assets.cancel,
//                           package: BaseStrings.flutterPackageName,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               onChanged: (content) {
//                 if (widget.onTextChange != null) {
//                   widget.onTextChange!(content);
//                 }
//                 setState(() {});
//               },
//               onSubmitted: (content) {
//                 if (widget.onTextCommit != null) {
//                   widget.onTextCommit!(content);
//                 }
//               },
//             ),
//           ),
//           Visibility(
//             visible: searchTextController!.isActionShow,
//             child: widget.action ??
//                 GestureDetector(
//                   onTap: () {
//                     if (widget.onActionTap != null) {
//                       widget.onActionTap!();
//                     }
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.fromLTRB(BaseSpacing.spacing4, 0, 0, 0),
//                     child: Row(
//                       children: [
//                         SvgPicture.asset(
//                           Assets.filter,
//                           package: BaseStrings.flutterPackageName,
//                         ),
//                         Text(
//                           BaseStrings.filter,
//                           style: BaseStyle.labelSmall.applyColor(BaseColors.textSubtitle),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class BaseSearchTextController extends ChangeNotifier {
//   bool _isClearShow = true;
//   bool _isActionShow = false;

//   bool get isClearShow => _isClearShow;

//   bool get isActionShow => _isActionShow;

//   set isClearShow(bool value) {
//     _isClearShow = value;
//     notifyListeners();
//   }

//   set isActionShow(bool value) {
//     _isActionShow = value;
//     notifyListeners();
//   }
// }
