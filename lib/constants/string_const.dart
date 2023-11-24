import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum Language { vi, en }

class StringConst {
  static AppLocalizations? get(BuildContext context) =>
      AppLocalizations.of(context);

  static Language getCurrentLanguage(BuildContext context) =>
      get(context)!.localeName == 'vi' ? Language.vi : Language.en;
}
