

import 'package:event/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';

extension MediaQueryExtension on BuildContext{
  Size get screenSize => MediaQuery.of(this).size;
  double get screenHeight => screenSize.height;
  double get screenWidth => screenSize.width;
}

extension AppLocalization on BuildContext{
  AppLocalizations get localization => AppLocalizations.of(this)!;
}