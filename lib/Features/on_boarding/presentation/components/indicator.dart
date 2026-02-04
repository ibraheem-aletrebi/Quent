import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/on_boarding/presentation/cubits/on_boarding_cubits/on_boarding_cubit.dart';
import 'package:quent/core/cubits/theme_cubit/theme_cubit.dart';

class Indicator extends StatelessWidget {
  const Indicator({super.key});

  @override
  Widget build(BuildContext context) {
    final onBoardingController = context.watch<OnBoardingCubit>();
    final themeController = context.watch<ThemeCubit>();
    return Row(
      children: List.generate(onBoardingController.pages!.length, (i) {
        final bool selected = onBoardingController.currentPageIndex == i;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          margin: const EdgeInsets.only(right: 6),
          height: 6,
          width: selected ? 26 : 6,
          decoration: BoxDecoration(
            color: selected
                ? (themeController.isDarkMode ? Colors.white : Colors.black)
                : (themeController.isDarkMode
                      ? Colors.white24
                      : Colors.black26),
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}
