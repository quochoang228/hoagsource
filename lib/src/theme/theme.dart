import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hoagsource/hoagsource.dart';

@immutable
class BaseTheme extends ThemeExtension<BaseTheme> with DiagnosticableTreeMixin {
  /// The tokens of the Base Design System.
  final BaseTokens tokens;

  /// The theming of the Base Design System BaseAccordion widget.
  final BaseAccordionTheme accordionTheme;

  // /// The theming of the Base Design System BaseAlert widget.
  final BaseAlertTheme alertTheme;
  //
  // /// The theming of the Base Design System BaseAuthCode widget.
  final BaseAuthCodeTheme authCodeTheme;
  //
  // /// The theming of the Base Design System BaseAvatar widget.
  // final BaseAvatarTheme avatarTheme;
  //
  // /// The theming of the Base Design System BaseBottomSheet widget.
  // final BaseBottomSheetTheme bottomSheetTheme;
  //
  // /// The theming of the Base Design System BaseBreadcrumb widget.
  // final BaseBreadcrumbTheme breadcrumbTheme;
  //
  // /// The theming of the Base Design System BaseButton widget.
  // final BaseButtonTheme buttonTheme;
  //
  // /// The theming of the Base Design System BaseCarousel widget.
  // final BaseCarouselTheme carouselTheme;
  //
  // /// The theming of the Base Design System BaseCheckbox widget.
  // final BaseCheckboxTheme checkboxTheme;
  //
  // /// The theming of the Base Design System BaseChip widget.
  // final BaseChipTheme chipTheme;
  //
  // /// The theming of the Base Design System BaseCircularLoader widget.
  // final BaseCircularLoaderTheme circularLoaderTheme;
  //
  // /// The theming of the Base Design System BaseCircularProgress widget.
  // final BaseCircularProgressTheme circularProgressTheme;
  //
  // /// The theming of the Base Design System BaseDotIndicator widget.
  // final BaseDotIndicatorTheme dotIndicatorTheme;
  //
  // /// The theming of the Base Design System BaseDrawer widget.
  // final BaseDrawerTheme drawerTheme;
  //
  // /// The theming of the Base Design System BaseDropdown widget.
  // final BaseDropdownTheme dropdownTheme;
  //
  // /// The theming of the Base Design System effects.
  final BaseTokenEffectsTheme effects;

  //
  // /// The theming of the Base Design System BaseLinearLoader widget.
  // final BaseLinearLoaderTheme linearLoaderTheme;
  //
  // /// The theming of the Base Design System BaseLinearProgress widget.
  // final BaseLinearProgressTheme linearProgressTheme;
  //
  // /// The theming of the Base Design System BaseMenuItem widget.
  // final BaseMenuItemTheme menuItemTheme;
  //
  // /// The theming of the Base Design System BaseModal widget.
  // final BaseModalTheme modalTheme;
  //
  // /// The theming of the Base Design System BasePopover widget.
  // final BasePopoverTheme popoverTheme;
  //
  // /// The theming of the Base Design System BaseProgressPin widget.
  // final BaseProgressPinTheme progressPinTheme;
  //
  // /// The theming of the Base Design System BaseRadio widget.
  // final BaseRadioTheme radioTheme;
  //
  // /// The theming of the Base Design System BaseSegmentedControl widget.
  // final BaseSegmentedControlTheme segmentedControlTheme;
  //
  // /// The theming of the Base Design System BaseSwitch widget.
  // final BaseSwitchTheme switchTheme;
  //
  // /// The theming of the Base Design System BaseTabBar widget.
  // final BaseTabBarTheme tabBarTheme;
  //
  // /// The theming of the Base Design System BaseTable widget.
  // final BaseTableTheme tableTheme;
  //
  // /// The theming of the Base Design System BaseTag widget.
  // final BaseTagTheme tagTheme;
  //
  // /// The theming of the Base Design System BaseTextArea widget.
  // final BaseTextAreaTheme textAreaTheme;
  //
  // /// The theming of the Base Design System BaseTextInput widget.
  // final BaseTextInputTheme textInputTheme;
  //
  // /// The theming of the Base Design System BaseTextInputGroup widget.
  // final BaseTextInputGroupTheme textInputGroupTheme;
  //
  // /// The theming of the Base Design System BaseToast widget.
  // final BaseToastTheme toastTheme;
  //
  // /// The theming of the Base Design System BaseTooltip widget.
  // final BaseTooltipTheme tooltipTheme;

  BaseTheme({
    required this.tokens,
    BaseAccordionTheme? accordionTheme,
    BaseAlertTheme? alertTheme,
    BaseAuthCodeTheme? authCodeTheme,
    // BaseAvatarTheme? avatarTheme,
    // BaseBottomSheetTheme? bottomSheetTheme,
    // BaseBreadcrumbTheme? breadcrumbTheme,
    // BaseButtonTheme? buttonTheme,
    // BaseCarouselTheme? carouselTheme,
    // BaseCheckboxTheme? checkboxTheme,
    // BaseChipTheme? chipTheme,
    // BaseCircularLoaderTheme? circularLoaderTheme,
    // BaseCircularProgressTheme? circularProgressTheme,
    // BaseDotIndicatorTheme? dotIndicatorTheme,
    // BaseDrawerTheme? drawerTheme,
    // BaseDropdownTheme? dropdownTheme,
    BaseTokenEffectsTheme? effects,
    // BaseLinearLoaderTheme? linearLoaderTheme,
    // BaseLinearProgressTheme? linearProgressTheme,
    // BaseMenuItemTheme? menuItemTheme,
    // BaseModalTheme? modalTheme,
    // BasePopoverTheme? popoverTheme,
    // BaseProgressPinTheme? progressPinTheme,
    // BaseRadioTheme? radioTheme,
    // BaseSegmentedControlTheme? segmentedControlTheme,
    // BaseSwitchTheme? switchTheme,
    // BaseTabBarTheme? tabBarTheme,
    // BaseTableTheme? tableTheme,
    // BaseTagTheme? tagTheme,
    // BaseTextAreaTheme? textAreaTheme,
    // BaseTextInputTheme? textInputTheme,
    // BaseTextInputGroupTheme? textInputGroupTheme,
    // BaseToastTheme? toastTheme,
    // BaseTooltipTheme? tooltipTheme,
  })  : accordionTheme = accordionTheme ?? BaseAccordionTheme(tokens: tokens),
        // ,
        alertTheme = alertTheme ?? BaseAlertTheme(tokens: tokens),
        authCodeTheme = authCodeTheme ?? BaseAuthCodeTheme(tokens: tokens),
        //       avatarTheme = avatarTheme ?? BaseAvatarTheme(tokens: tokens),
        //       bottomSheetTheme =
        //           bottomSheetTheme ?? BaseBottomSheetTheme(tokens: tokens),
        //       breadcrumbTheme =
        //           breadcrumbTheme ?? BaseBreadcrumbTheme(tokens: tokens),
        //       buttonTheme = buttonTheme ?? BaseButtonTheme(tokens: tokens),
        //       carouselTheme = carouselTheme ?? BaseCarouselTheme(tokens: tokens),
        //       checkboxTheme = checkboxTheme ?? BaseCheckboxTheme(tokens: tokens),
        //       chipTheme = chipTheme ?? BaseChipTheme(tokens: tokens),
        //       circularLoaderTheme =
        //           circularLoaderTheme ?? BaseCircularLoaderTheme(tokens: tokens),
        //       circularProgressTheme =
        //           circularProgressTheme ?? BaseCircularProgressTheme(tokens: tokens),
        //       dotIndicatorTheme =
        //           dotIndicatorTheme ?? BaseDotIndicatorTheme(tokens: tokens),
        //       drawerTheme = drawerTheme ?? BaseDrawerTheme(tokens: tokens),
        //       dropdownTheme = dropdownTheme ?? BaseDropdownTheme(tokens: tokens),
        //       linearLoaderTheme =
        //           linearLoaderTheme ?? BaseLinearLoaderTheme(tokens: tokens),
        //       linearProgressTheme =
        //           linearProgressTheme ?? BaseLinearProgressTheme(tokens: tokens),
        //       menuItemTheme = menuItemTheme ?? BaseMenuItemTheme(tokens: tokens),
        //       modalTheme = modalTheme ?? BaseModalTheme(tokens: tokens),
        //       popoverTheme = popoverTheme ?? BasePopoverTheme(tokens: tokens),
        //       progressPinTheme =
        //           progressPinTheme ?? BaseProgressPinTheme(tokens: tokens),
        //       radioTheme = radioTheme ?? BaseRadioTheme(tokens: tokens),
        //       segmentedControlTheme =
        //           segmentedControlTheme ?? BaseSegmentedControlTheme(tokens: tokens),
        //       switchTheme = switchTheme ?? BaseSwitchTheme(tokens: tokens),
        //       tabBarTheme = tabBarTheme ?? BaseTabBarTheme(tokens: tokens),
        //       tableTheme = tableTheme ?? BaseTableTheme(tokens: tokens),
        //       tagTheme = tagTheme ?? BaseTagTheme(tokens: tokens),
        //       textAreaTheme = textAreaTheme ?? BaseTextAreaTheme(tokens: tokens),
        //       textInputTheme = textInputTheme ?? BaseTextInputTheme(tokens: tokens),
        //       textInputGroupTheme =
        //           textInputGroupTheme ?? BaseTextInputGroupTheme(tokens: tokens),
        //       toastTheme = toastTheme ?? BaseToastTheme(tokens: tokens),
        //       tooltipTheme = tooltipTheme ?? BaseTooltipTheme(tokens: tokens)
        effects = effects ?? BaseTokenEffectsTheme(tokens: tokens);

  @override
  BaseTheme copyWith({
    BaseTokens? tokens,
    BaseAccordionTheme? accordionTheme,
    BaseAlertTheme? alertTheme,
    BaseAuthCodeTheme? authCodeTheme,
    // BaseAvatarTheme? avatarTheme,
    // BaseBottomSheetTheme? bottomSheetTheme,
    // BaseBreadcrumbTheme? breadcrumbTheme,
    // BaseButtonTheme? buttonTheme,
    // BaseCarouselTheme? carouselTheme,
    // BaseCheckboxTheme? checkboxTheme,
    // BaseChipTheme? chipTheme,
    // BaseCircularLoaderTheme? circularLoaderTheme,
    // BaseCircularProgressTheme? circularProgressTheme,
    // BaseDotIndicatorTheme? dotIndicatorTheme,
    // BaseDrawerTheme? drawerTheme,
    // BaseDropdownTheme? dropdownTheme,
    BaseTokenEffectsTheme? effects,
    // BaseLinearLoaderTheme? linearLoaderTheme,
    // BaseLinearProgressTheme? linearProgressTheme,
    // BaseMenuItemTheme? menuItemTheme,
    // BaseModalTheme? modalTheme,
    // BasePopoverTheme? popoverTheme,
    // BaseProgressPinTheme? progressPinTheme,
    // BaseRadioTheme? radioTheme,
    // BaseSegmentedControlTheme? segmentedControlTheme,
    // BaseSwitchTheme? switchTheme,
    // BaseTabBarTheme? tabBarTheme,
    // BaseTableTheme? tableTheme,
    // BaseTagTheme? tagTheme,
    // BaseTextAreaTheme? textAreaTheme,
    // BaseTextInputTheme? textInputTheme,
    // BaseTextInputGroupTheme? textInputGroupTheme,
    // BaseToastTheme? toastTheme,
    // BaseTooltipTheme? tooltipTheme,
  }) {
    return BaseTheme(
      tokens: tokens ?? this.tokens,
      accordionTheme: accordionTheme ?? this.accordionTheme,
      alertTheme: alertTheme ?? this.alertTheme,
      authCodeTheme: authCodeTheme ?? this.authCodeTheme,
      // avatarTheme: avatarTheme ?? this.avatarTheme,
      // bottomSheetTheme: bottomSheetTheme ?? this.bottomSheetTheme,
      // breadcrumbTheme: breadcrumbTheme ?? this.breadcrumbTheme,
      // buttonTheme: buttonTheme ?? this.buttonTheme,
      // carouselTheme: carouselTheme ?? this.carouselTheme,
      // checkboxTheme: checkboxTheme ?? this.checkboxTheme,
      // chipTheme: chipTheme ?? this.chipTheme,
      // circularLoaderTheme: circularLoaderTheme ?? this.circularLoaderTheme,
      // circularProgressTheme:
      // circularProgressTheme ?? this.circularProgressTheme,
      // dotIndicatorTheme: dotIndicatorTheme ?? this.dotIndicatorTheme,
      // drawerTheme: drawerTheme ?? this.drawerTheme,
      // dropdownTheme: dropdownTheme ?? this.dropdownTheme,
      effects: effects ?? this.effects,
      // linearLoaderTheme: linearLoaderTheme ?? this.linearLoaderTheme,
      // linearProgressTheme: linearProgressTheme ?? this.linearProgressTheme,
      // menuItemTheme: menuItemTheme ?? this.menuItemTheme,
      // modalTheme: modalTheme ?? this.modalTheme,
      // popoverTheme: popoverTheme ?? this.popoverTheme,
      // progressPinTheme: progressPinTheme ?? this.progressPinTheme,
      // radioTheme: radioTheme ?? this.radioTheme,
      // segmentedControlTheme:
      // segmentedControlTheme ?? this.segmentedControlTheme,
      // switchTheme: switchTheme ?? this.switchTheme,
      // tabBarTheme: tabBarTheme ?? this.tabBarTheme,
      // tableTheme: tableTheme ?? this.tableTheme,
      // tagTheme: tagTheme ?? this.tagTheme,
      // textAreaTheme: textAreaTheme ?? this.textAreaTheme,
      // textInputTheme: textInputTheme ?? this.textInputTheme,
      // textInputGroupTheme: textInputGroupTheme ?? this.textInputGroupTheme,
      // toastTheme: toastTheme ?? this.toastTheme,
      // tooltipTheme: tooltipTheme ?? this.tooltipTheme,
    );
  }

  @override
  BaseTheme lerp(ThemeExtension<BaseTheme>? other, double t) {
    if (other is! BaseTheme) return this;

    return BaseTheme(
      tokens: tokens.lerp(other.tokens, t),
      accordionTheme: accordionTheme.lerp(other.accordionTheme, t),
      alertTheme: alertTheme.lerp(other.alertTheme, t),
      authCodeTheme: authCodeTheme.lerp(other.authCodeTheme, t),
      // avatarTheme: avatarTheme.lerp(other.avatarTheme, t),
      // bottomSheetTheme: bottomSheetTheme.lerp(other.bottomSheetTheme, t),
      // breadcrumbTheme: breadcrumbTheme.lerp(other.breadcrumbTheme, t),
      // buttonTheme: buttonTheme.lerp(other.buttonTheme, t),
      // carouselTheme: carouselTheme.lerp(other.carouselTheme, t),
      // checkboxTheme: checkboxTheme.lerp(other.checkboxTheme, t),
      // chipTheme: chipTheme.lerp(other.chipTheme, t),
      // circularLoaderTheme:
      // circularLoaderTheme.lerp(other.circularLoaderTheme, t),
      // circularProgressTheme:
      // circularProgressTheme.lerp(other.circularProgressTheme, t),
      // dotIndicatorTheme: dotIndicatorTheme.lerp(other.dotIndicatorTheme, t),
      // drawerTheme: drawerTheme.lerp(other.drawerTheme, t),
      // dropdownTheme: dropdownTheme.lerp(other.dropdownTheme, t),
      effects: effects.lerp(other.effects, t),
      // linearLoaderTheme: linearLoaderTheme.lerp(other.linearLoaderTheme, t),
      // linearProgressTheme:
      // linearProgressTheme.lerp(other.linearProgressTheme, t),
      // menuItemTheme: menuItemTheme.lerp(other.menuItemTheme, t),
      // modalTheme: modalTheme.lerp(other.modalTheme, t),
      // popoverTheme: popoverTheme.lerp(other.popoverTheme, t),
      // progressPinTheme: progressPinTheme.lerp(other.progressPinTheme, t),
      // radioTheme: radioTheme.lerp(other.radioTheme, t),
      // segmentedControlTheme:
      // segmentedControlTheme.lerp(other.segmentedControlTheme, t),
      // switchTheme: switchTheme.lerp(other.switchTheme, t),
      // tabBarTheme: tabBarTheme.lerp(other.tabBarTheme, t),
      // tableTheme: tableTheme.lerp(other.tableTheme, t),
      // tagTheme: tagTheme.lerp(other.tagTheme, t),
      // textAreaTheme: textAreaTheme.lerp(other.textAreaTheme, t),
      // textInputTheme: textInputTheme.lerp(other.textInputTheme, t),
      // textInputGroupTheme:
      // textInputGroupTheme.lerp(other.textInputGroupTheme, t),
      // toastTheme: toastTheme.lerp(other.toastTheme, t),
      // tooltipTheme: tooltipTheme.lerp(other.tooltipTheme, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
          ..add(
            DiagnosticsProperty(
              "type",
              "BaseTheme",
            ),
          )
          ..add(
            DiagnosticsProperty<BaseTokens>(
              "BaseTokens",
              tokens,
            ),
          )
          ..add(
            DiagnosticsProperty<BaseAccordionTheme>(
              "BaseAccordionTheme",
              accordionTheme,
            ),
          )
          ..add(
            DiagnosticsProperty<BaseAlertTheme>(
              "BaseAlertTheme",
              alertTheme,
            ),
          )
          ..add(
            DiagnosticsProperty<BaseAuthCodeTheme>(
              "BaseAuthCodeTheme",
              authCodeTheme,
            ),
          )
          // ..add(
          //   DiagnosticsProperty<BaseAvatarTheme>(
          //     "BaseAvatarTheme",
          //     avatarTheme,
          //   ),
          // )
          // ..add(
          //   DiagnosticsProperty<BaseBottomSheetTheme>(
          //     "BaseBottomSheetTheme",
          //     bottomSheetTheme,
          //   ),
          // )
          // ..add(
          //   DiagnosticsProperty<BaseBreadcrumbTheme>(
          //     "BaseBreadcrumbTheme",
          //     breadcrumbTheme,
          //   ),
          // )
          // ..add(
          //   DiagnosticsProperty<BaseButtonTheme>(
          //     "BaseButtonTheme",
          //     buttonTheme,
          //   ),
          // )
          // ..add(
          //   DiagnosticsProperty<BaseCarouselTheme>(
          //     "BaseCarouselTheme",
          //     carouselTheme,
          //   ),
          // )
          // ..add(
          //   DiagnosticsProperty<BaseCheckboxTheme>(
          //     "BaseCheckboxTheme",
          //     checkboxTheme,
          //   ),
          // )
          // ..add(
          //   DiagnosticsProperty<BaseChipTheme>(
          //     "BaseChipTheme",
          //     chipTheme,
          //   ),
          // )
          // ..add(
          //   DiagnosticsProperty<BaseCircularLoaderTheme>(
          //     "BaseCircularLoaderTheme",
          //     circularLoaderTheme,
          //   ),
          // )
          // ..add(
          //   DiagnosticsProperty<BaseCircularProgressTheme>(
          //     "BaseCircularProgressTheme",
          //     circularProgressTheme,
          //   ),
          // )
          // ..add(
          //   DiagnosticsProperty<BaseDotIndicatorTheme>(
          //     "BaseDotIndicatorTheme",
          //     dotIndicatorTheme,
          //   ),
          // )
          // ..add(
          //   DiagnosticsProperty<BaseDrawerTheme>(
          //     "BaseDrawerTheme",
          //     drawerTheme,
          //   ),
          // )
          // ..add(
          //   DiagnosticsProperty<BaseDropdownTheme>(
          //     "BaseDropdownTheme",
          //     dropdownTheme,
          //   ),
          // )
          ..add(
            DiagnosticsProperty<BaseTokenEffectsTheme>(
              "BaseEffectsTheme",
              effects,
            ),
          )
        // ..add(
        //   DiagnosticsProperty<BaseLinearLoaderTheme>(
        //     "BaseLinearLoaderTheme",
        //     linearLoaderTheme,
        //   ),
        // )
        // ..add(
        //   DiagnosticsProperty<BaseLinearProgressTheme>(
        //     "BaseLinearProgressTheme",
        //     linearProgressTheme,
        //   ),
        // )
        // ..add(
        //   DiagnosticsProperty<BaseMenuItemTheme>(
        //     "BaseMenuItemTheme",
        //     menuItemTheme,
        //   ),
        // )
        // ..add(
        //   DiagnosticsProperty<BaseModalTheme>(
        //     "BaseModalTheme",
        //     modalTheme,
        //   ),
        // )
        // ..add(
        //   DiagnosticsProperty<BasePopoverTheme>(
        //     "BasePopoverTheme",
        //     popoverTheme,
        //   ),
        // )
        // ..add(
        //   DiagnosticsProperty<BaseProgressPinTheme>(
        //     "BaseProgressPinTheme",
        //     progressPinTheme,
        //   ),
        // )
        // ..add(
        //   DiagnosticsProperty<BaseRadioTheme>(
        //     "BaseRadioTheme",
        //     radioTheme,
        //   ),
        // )
        // ..add(
        //   DiagnosticsProperty<BaseSegmentedControlTheme>(
        //     "BaseSegmentedControlTheme",
        //     segmentedControlTheme,
        //   ),
        // )
        // ..add(
        //   DiagnosticsProperty<BaseSwitchTheme>(
        //     "BaseSwitchTheme",
        //     switchTheme,
        //   ),
        // )
        // ..add(
        //   DiagnosticsProperty<BaseTabBarTheme>(
        //     "BaseTabBarTheme",
        //     tabBarTheme,
        //   ),
        // )
        // ..add(
        //   DiagnosticsProperty<BaseTableTheme>(
        //     "BaseTableTheme",
        //     tableTheme,
        //   ),
        // )
        // ..add(
        //   DiagnosticsProperty<BaseTagTheme>(
        //     "BaseTagTheme",
        //     tagTheme,
        //   ),
        // )
        // ..add(
        //   DiagnosticsProperty<BaseTextAreaTheme>(
        //     "BaseTextAreaTheme",
        //     textAreaTheme,
        //   ),
        // )
        // ..add(
        //   DiagnosticsProperty<BaseTextInputTheme>(
        //     "BaseTextInputTheme",
        //     textInputTheme,
        //   ),
        // )
        // ..add(
        //   DiagnosticsProperty<BaseTextInputGroupTheme>(
        //     "BaseTextInputGroupTheme",
        //     textInputGroupTheme,
        //   ),
        // )
        // ..add(
        //   DiagnosticsProperty<BaseToastTheme>(
        //     "BaseToastTheme",
        //     toastTheme,
        //   ),
        // )
        // ..add(
        //   DiagnosticsProperty<BaseTooltipTheme>(
        //     "BaseTooltipTheme",
        //     tooltipTheme,
        //   ),
        // )
        ;
  }
}

extension BaseThemeX on BuildContext {
  BaseTheme? get baseTheme => Theme.of(this).extension<BaseTheme>();

  BaseTokenBorders? get baseTokenBorders => baseTheme?.tokens.borders;

  BaseTokenColors? get baseTokenColors => baseTheme?.tokens.colors;

  BaseTokenEffectsTheme? get baseTokenEffects => baseTheme?.effects;

  BaseTokenOpacities? get baseTokenOpacities => baseTheme?.tokens.opacities;

  BaseTokenShadows? get baseTokenShadows => baseTheme?.tokens.shadows;

  BaseTokenSizes? get baseTokenSizes => baseTheme?.tokens.sizes;

  BaseTokenTransitions? get baseTokenTransitions =>
      baseTheme?.tokens.transitions;

  BaseTokenTypography? get baseTokenTypography => baseTheme?.tokens.typography;
}
