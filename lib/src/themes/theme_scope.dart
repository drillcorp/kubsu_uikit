import 'package:flutter/material.dart';
import 'package:kubsu_design_system/src/themes/texts.dart';

import 'colors.dart';
import 'kubsu_theme.dart';

final class ThemeScope extends InheritedWidget {
  ThemeScope({required super.child, super.key, required this.theme, this.themeMode = ThemeMode.system}) {}

  late final KubsuTheme theme;
  final ThemeMode themeMode;

  static ThemeScope of(BuildContext context) {
    final result = context.getInheritedWidgetOfExactType<ThemeScope>();
    assert(result != null, "This context dose not contain ThemeScope");
    return result!;
  }

  @override
  bool updateShouldNotify(ThemeScope oldWidget) =>
      oldWidget.theme.colors != oldWidget.theme.colors && themeMode != oldWidget.themeMode;
}

extension KubsuThemeExt on BuildContext {
  ThemeScope get themeScope => ThemeScope.of(this);

  KubsuColors get appColors => ThemeScope.of(this).theme.colors;

  KubsuTexts get appTexts => ThemeScope.of(this).theme.textsTheme;
}
