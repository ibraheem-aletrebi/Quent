import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/core/constants/hive_keys.dart';
import 'package:quent/core/cubits/theme_cubit/theme_state.dart';
import 'package:quent/core/services/local/local_storage_helper.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
    : super(
        ThemeInitial(
          isDarkMode:
              LocalStorageHelper().getValue<bool>(HiveKeys.isDarkMode) ?? true,
        ),
      );

  bool get isDarkMode => state.isDarkMode;
  void toggleTheme() {
    final newValue = !state.isDarkMode;
    LocalStorageHelper().setValue<bool>(HiveKeys.isDarkMode, newValue);
    emit(ThemeChanged(isDarkMode: newValue));
  }
}
