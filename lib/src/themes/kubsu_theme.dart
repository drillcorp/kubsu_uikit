import 'package:kubsu_design_system/src/themes/colors.dart';
import 'package:kubsu_design_system/src/themes/texts.dart';

abstract interface class KubsuTheme {
  KubsuColors get colors;

  KubsuTexts get textsTheme;
}

final class LightTheme implements KubsuTheme {
  @override
  KubsuColors get colors => KubsuColors();

  @override
  KubsuTexts get textsTheme => KubsuTexts(textColor: colors.textPrimary);
}
