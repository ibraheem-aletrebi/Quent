import 'package:equatable/equatable.dart';

sealed class ThemeState extends Equatable {
  final bool isDarkMode;

  const ThemeState({required this.isDarkMode});
  @override
  List<Object?> get props => [isDarkMode];
}

final class ThemeInitial extends ThemeState {
  const ThemeInitial({required super.isDarkMode});
}

final class ThemeChanged extends ThemeState {
  const ThemeChanged({required super.isDarkMode});
}
