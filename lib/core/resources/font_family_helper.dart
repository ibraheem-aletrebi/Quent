import 'package:quent/core/services/local/preference_manager.dart';

class FontFamilyHelper {
  FontFamilyHelper._();

  static const String alexandria = 'Alexandria';
  static const String nunito = 'Nunito';

 static String getLocalizedFontFamily() {
    final languageCode = PreferenceManager().getString('languageCode') ?? 'en';
    switch (languageCode) {
      case 'ar':
        return alexandria;
      case 'en':
        return nunito;
      default:
        return nunito;
    }
  }

}
