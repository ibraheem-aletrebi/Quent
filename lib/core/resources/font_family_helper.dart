import 'dart:ui';

class FontFamilyHelper {
  FontFamilyHelper._();

  static const String alexandria = 'Alexandria';
  static const String nunito = 'Nunito';

  static String fromLocale(Locale locale) {
    return locale.languageCode == 'ar'
        ? alexandria
        : nunito;
  }
}
