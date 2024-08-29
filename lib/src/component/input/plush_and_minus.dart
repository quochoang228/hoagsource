// import 'package:base_ui/base_ui.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../../constants/assets.dart';
// import '../../constants/string.dart';

// class PlushAndMinus extends HookConsumerWidget {
//   const PlushAndMinus({
//     super.key,
//     required this.quantity,
//     this.onPlush,
//     this.onMinus,
//     this.onFieldSubmitted,
//     this.radius = const BorderRadius.all(Radius.circular(8)),
//     this.isEnable = true,
//   });

//   final num quantity;
//   final Function? onPlush;
//   final Function? onMinus;
//   final Function? onFieldSubmitted;
//   final BorderRadius radius;
//   final bool isEnable;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     var focusNode = FocusNode();
//     var textController = useTextEditingController(text: quantity.toString());
//     focusNode.addListener(() => textController.text = quantity.toString());
//     var borderColor = isEnable ? BaseColors.borderDefault : BaseColors.backgroundDisable;
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(color: borderColor),
//         borderRadius: BorderRadius.circular(BaseRadius.radiusMd),
//         color: isEnable ? CoreColors.transparent : BaseColors.backgroundDisable,
//       ),
//       child: Row(
//         children: [
//           InkWell(
//             onTap: onMinus != null
//                 ? () {
//                     onMinus!();
//                   }
//                 : null,
//             child: Container(
//               decoration: BoxDecoration(
//                 border: Border(
//                   right: BorderSide(color: borderColor),
//                 ),
//               ),
//               padding: const EdgeInsets.all(BaseSpacing.spacing2),
//               child: SvgPicture.asset(
//                 Assets.minus16,
//                 package: BaseStrings.flutterPackageName,
//                 colorFilter: ColorFilter.mode(isEnable ? BaseColors.textBody : BaseColors.textDisable, BlendMode.srcIn),
//               ),
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: BaseSpacing.spacing3),
//             alignment: Alignment.center,
//             child: Text(
//               '$quantity',
//               style: BaseStyle.labelSmall.applyColor(isEnable ? BaseColors.textTitle : BaseColors.textDisable),
//             ),
//           ),
//           InkWell(
//             onTap: onPlush != null
//                 ? () {
//                     onPlush!();
//                   }
//                 : null,
//             child: Container(
//               decoration: BoxDecoration(
//                 border: Border(
//                   left: BorderSide(color: borderColor),
//                 ),
//               ),
//               padding: const EdgeInsets.all(BaseSpacing.spacing2),
//               child: SvgPicture.asset(
//                 Assets.plus16,
//                 package: BaseStrings.flutterPackageName,
//                 colorFilter: ColorFilter.mode(isEnable ? BaseColors.textBody : BaseColors.textDisable, BlendMode.srcIn),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
