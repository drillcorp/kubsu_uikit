import 'package:flutter/material.dart';
import 'package:kubsu_design_system/kubsu_design_system.dart';

abstract class KubsuButtonDelegate {
  KubsuButtonDelegate({required this.context, this.onTap});

  final BuildContext context;
  final VoidCallback? onTap;

  EdgeInsets padding = const EdgeInsets.symmetric(vertical: 14);
  Color? backgroundColor;

  TextStyle get style => context.appTexts.body;

  List<BoxShadow> get boxShadow => [BoxShadow()];

  BorderRadius get radius => const BorderRadius.all(Radius.circular(12));

  Color get splashColor;

  Color get highlightColor;

  Color? get iconColor;

  bool get isDisable => onTap == null;

  Border? get border;
}

final class PrimaryDelegate extends KubsuButtonDelegate {
  PrimaryDelegate({required super.context, super.onTap});

  @override
  TextStyle get style => super.style.copyWith(color: context.appColors.textButtonPrimary);

  @override
  Color get backgroundColor =>
      isDisable ? context.appColors.surfaceButtonPrimaryDisabled : context.appColors.surfaceButtonPrimary;

  @override
  Color get highlightColor => Colors.blueAccent;

  @override
  Color get splashColor => Colors.blueAccent;

  @override
  List<BoxShadow> get boxShadow =>
      isDisable ? [] : [BoxShadow(blurRadius: 4, color: context.appColors.surfaceButtonPrimary, offset: Offset(0, 4))];

  @override
  Border? get border => null;

  @override
  Color? get iconColor => context.appColors.iconIconButtonPrimary;
}

final class SecondaryDelegate extends KubsuButtonDelegate {
  SecondaryDelegate({required super.context, super.onTap});

  @override
  Color get backgroundColor =>
      isDisable ? context.appColors.surfaceButtonSecondaryDisabled : context.appColors.surfaceButtonSecondary;

  @override
  TextStyle get style => super.style.copyWith(
    color: isDisable ? context.appColors.textButtonSecondaryDisabled : context.appColors.textButtonSecondary,
  );

  @override
  Color get splashColor => context.appColors.borderButtonSecondary;

  @override
  Border? get border => Border.all(
    width: 1,
    color: isDisable ? context.appColors.borderButtonSecondaryDisabled : context.appColors.borderButtonSecondary,
  );

  @override
  Color get highlightColor => context.appColors.borderButtonSecondary;

  @override
  Color? get iconColor => context.appColors.iconIconButtonSecondary;
}

final class DefaultDelegate extends KubsuButtonDelegate {
  DefaultDelegate({required super.context, super.onTap});

  @override
  Color? get backgroundColor => context.appColors.surfacePrimary;

  @override
  Border? get border => Border.all(color: context.appColors.borderPrimary);

  @override
  Color get highlightColor => context.appColors.borderPrimary;

  @override
  Color get splashColor => context.appColors.borderPrimary;

  @override
  Color? get iconColor => context.appColors.iconPrimary;
}

final class ErrorDelegate extends KubsuButtonDelegate {
  ErrorDelegate({required super.context, super.onTap});

  @override
  Color? get backgroundColor => context.appColors.surfaceIconButtonError;

  @override
  Border? get border => Border.all(color: context.appColors.borderIconButtonError);

  @override
  Color get highlightColor => context.appColors.borderIconButtonError;

  @override
  Color get splashColor => context.appColors.borderIconButtonError;

  @override
  Color? get iconColor => context.appColors.iconIconButtonError;
}
