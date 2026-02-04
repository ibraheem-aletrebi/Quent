import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/core/cubits/language_cubit/language_cubit.dart';
import 'package:quent/core/cubits/language_cubit/language_state.dart';
import 'package:quent/generated/l10n.dart';

class LanguageDropdownMenu extends StatelessWidget {
  const LanguageDropdownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        final currentLang = state.languageCode;
        return DropdownButton<String>(
          value: currentLang,
          underline: const SizedBox(),
          onChanged: (String? newValue) {
            if (newValue != null) {
              context.read<LanguageCubit>().changeLanguage(newValue);
            }
          },
          items: [
            DropdownMenuItem(
              value: 'en',
              child: Text(
                S.of(context).En,
                style: TextTheme.of(context).titleLarge,
              ),
            ),
            DropdownMenuItem(
              value: 'ar',
              child: Text(
                S.of(context).Ar,
                style: TextTheme.of(context).titleLarge,
              ),
            ),
          ],
        );
      },
    );
  }
}
