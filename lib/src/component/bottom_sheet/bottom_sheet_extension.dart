// import 'package:flutter/material.dart';
// import 'package:base_ui/base_ui.dart';
// import 'package:base_ui/constants/assets.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

// import '../../constants/string.dart';


// enum BottomSheetType {
//   single,
//   list;
// }

// extension Modal on BuildContext {
//   void showBottomSheet({
//     Widget? child,
//     BottomSheetType type = BottomSheetType.single,
//     String text = '',
//     final Widget? stickyActionBar,
//     final Widget? pageTitle,

//     /// A widget representing leading widget in the navigation toolbar. This widget is usually
//     /// a the back button.
//     final Widget? leadingNavBarWidget,

//     /// A widget representing trailing widget in the navigation toolbar. This widget is usually
//     /// a the close button.
//     final Widget? trailingNavBarWidget,

//     // Signature for a function that builds a list of [SliverWoltModalSheetPage]
//     final List<Widget>? mainContentSlivers,
//   }) {
//     WoltModalSheet.show<void>(
//       context: this,
//       modalTypeBuilder: (context) {
//         return WoltModalType.bottomSheet;
//       },
//       onModalDismissedWithBarrierTap: () {
//         Navigator.pop(this);
//       },
//       // maxPageHeight: 0.9,
//       pageListBuilder: (modalSheetContext) {
//         return [
//           type == BottomSheetType.single
//               ? WoltModalSheetPage(
//               topBarTitle: Text(
//                 text,
//                 style: BaseStyle.headlineMedium,
//               ),
//               topBar: Container(
//                 color: BaseColors.backgroundWhite,
//                 child: Center(
//                   child: Text(
//                     text,
//                     style: BaseStyle.headlineMedium,
//                   ),
//                 ),
//               ),
//               backgroundColor: BaseColors.backgroundWhite,
//               stickyActionBar:  stickyActionBar != null ? Container(
//                 height: stickyActionBar != null ? kBottomNavigationBarHeight + 16  : 0,
//                 padding: const EdgeInsets.symmetric(
//                   vertical: BaseSpacing.spacing2,
//                   horizontal: BaseSpacing.spacing4,
//                 ),
//                 decoration: BoxDecoration(
//                   color: BaseColors.backgroundWhite,
//                   boxShadow: const [
//                     BaseEffect.shadowNavBarEffect1,
//                     BaseEffect.shadowNavigationBarEffect1,
//                   ],
//                 ),
//                 child: stickyActionBar,
//               ) : null,
//               // stickyActionBar: stickyActionBar,
//               pageTitle: pageTitle,

//               // leadingNavBarWidget: Padding(
//               //   padding: const EdgeInsets.all(16),
//               //   child: CircularElevatedButton(
//               //     icon: SvgPicture.asset(Assets.cancel),
//               //     onPressed: () {
//               //       Navigator.pop(this);
//               //     },
//               //   ),
//               // ),
//               trailingNavBarWidget: trailingNavBarWidget ??
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: CircularElevatedButton(
//                       icon: SvgPicture.asset(
//                         Assets.cancelSmall,
//                         package: BaseStrings.flutterPackageName,
//                       ),
//                       onPressed: () {
//                         Navigator.pop(this);
//                       },
//                     ),
//                   ),
//               isTopBarLayerAlwaysVisible: true,
//               child: Column(
//                 children: [
//                   child ?? const SizedBox(),
//                   stickyActionBar != null
//                       ? Container(
//                     height: 120,
//                     color: BaseColors.backgroundWhite,
//                   )
//                       : const SizedBox.shrink(),
//                 ],
//               ))
//               : SliverWoltModalSheetPage(
//             backgroundColor: BaseColors.backgroundWhite,
//             stickyActionBar: stickyActionBar,
//             topBarTitle: Text(
//               text,
//               style: BaseStyle.headlineMedium,
//             ),
//             topBar: Container(
//               color: BaseColors.backgroundWhite,
//               child: Center(
//                 child: Text(
//                   text,
//                   style: BaseStyle.headlineMedium,
//                 ),
//               ),
//             ),
//             pageTitle: pageTitle,
//             trailingNavBarWidget: trailingNavBarWidget ??
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   child: CircularElevatedButton(
//                     icon: SvgPicture.asset(
//                       Assets.cancelSmall,
//                       package: BaseStrings.flutterPackageName,
//                     ),
//                     onPressed: () {
//                       Navigator.pop(this);
//                     },
//                   ),
//                 ),
//             leadingNavBarWidget: leadingNavBarWidget ?? const SizedBox(),
//             isTopBarLayerAlwaysVisible: true,
//             mainContentSlivers: mainContentSlivers ?? [],
//           ),
//         ];
//       },
//     );
//   }


//   Future<T?> showHsBottomSheet<T>(WarningBottomSheetView modal) {
//     return showModalBottomSheet<T>(
//         useSafeArea: true,
//         isScrollControlled: true,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//             top: Radius.circular(BaseRadius.radiusLg),
//           ),
//         ),
//         context: this,
//         builder: (_) {
//           return SingleChildScrollView(child: modal);
//         });
//   }

//   void dismissHsBottomSheet() {
//     Navigator.maybeOf(this)?.popUntil((route) {
//       if (route.settings.name == null) {
//         return false;
//       }
//       return true;
//     });
//   }
// }