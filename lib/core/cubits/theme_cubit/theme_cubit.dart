import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/core/constants/storage_keys.dart';
import 'package:quent/core/cubits/theme_cubit/theme_state.dart';
import 'package:quent/core/services/local/preference_manager.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
    : super(
        ThemeInitial(
          isDarkMode:
              PreferenceManager().getBool(StorageKeys.isDarkMode) ?? true,
        ),
      );

  bool get isDarkMode => state.isDarkMode;
  void toggleTheme() {
    final newValue = !state.isDarkMode;
    PreferenceManager().setBool(StorageKeys.isDarkMode, newValue);
    emit(ThemeChanged(isDarkMode: newValue));
  }
}
