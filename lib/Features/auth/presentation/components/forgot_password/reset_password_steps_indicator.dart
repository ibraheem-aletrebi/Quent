import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/core/cubits/theme_cubit/theme_cubit.dart';
import 'package:quent/core/resources/app_color.dart';
import 'package:quent/core/resources/app_size.dart';

class ResetPasswordStepsIndicator extends StatelessWidget {
  const ResetPasswordStepsIndicator({
    super.key,
    required this.numberOfSteps,
    required this.currentStep,
  });
  final int numberOfSteps;
  final int currentStep;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<ThemeCubit>().isDarkMode;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(numberOfSteps * 2 - 1, (i) {
        if (i.isEven) {
          int stepIndex = i ~/ 2;
          bool isActive = currentStep >= stepIndex;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: isActive
                  ? Theme.of(context).primaryColor
                  : isDarkMode
                  ? AppColors.surfaceDarkColor
                  : AppColors.surfaceLightColor,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              '${stepIndex + 1}',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: isActive
                    ? AppColors.primaryDarkTextColor
                    : isDarkMode
                    ? AppColors.primaryDarkTextColor
                    : AppColors.primaryLightTextColor,
              ),
            ),
          );
        } else {
          int prevStepIndex = i ~/ 2;
          bool isActive = currentStep > prevStepIndex;
          return Container(
            width: AppSize.s60,
            height: AppSize.s2,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            alignment: Alignment.center,
            color: isActive
                ? Theme.of(context).primaryColor
                : isDarkMode
                ? AppColors.surfaceDarkColor
                : AppColors.surfaceLightColor,
          );
        }
      }),
    );
  }
}
