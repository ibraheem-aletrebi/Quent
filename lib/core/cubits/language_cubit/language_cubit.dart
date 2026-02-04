import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/core/constants/storage_keys.dart';
import 'package:quent/core/cubits/language_cubit/language_state.dart';
import 'package:quent/core/services/local/preference_manager.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(const LanguageInitial(languageCode: 'en')) {
    getSavedLanguage();
  }

  String currentLangCode = 'en';

  //Language Change
  void getSavedLanguage() {
    final result = PreferenceManager().containsKey(StorageKeys.languageCode)
        ? PreferenceManager().getString(StorageKeys.languageCode)
        : 'en';
    currentLangCode = result!;
    emit(LanguageChanged(languageCode: currentLangCode));
  }

  Future<void> changeLanguage(String langCode) async {
    await PreferenceManager().setString(StorageKeys.languageCode, langCode);
    currentLangCode = langCode;
    emit(LanguageChanged(languageCode: currentLangCode));
  }
}
