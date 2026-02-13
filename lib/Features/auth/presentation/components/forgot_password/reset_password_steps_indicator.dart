import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/core/cubits/language_cubit/language_cubit.dart';
import 'package:quent/core/cubits/theme_cubit/theme_cubit.dart';
import 'package:quent/core/resources/app_color.dart';
import 'package:quent/core/resources/app_radius.dart';
import 'package:quent/core/resources/app_size.dart';
import 'package:quent/core/utils/convert_to_arabic_number.dart';

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
    final isArabic = context.watch<LanguageCubit>().isArabic();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(numberOfSteps * 2 - 1, (i) {
        if (i.isEven) {
          int stepIndex = i ~/ 2;
          bool isCompleted = currentStep > stepIndex;
          bool isActive = currentStep >= stepIndex;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            width: AppSize.s32,
            height: AppSize.s32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive
                  ? AppColors.primaryColor
                  : isDarkMode
                  ? AppColors.surfaceDarkColor
                  : AppColors.surfaceLightColor,

              boxShadow: isActive
                  ? [
                      BoxShadow(
                        color: AppColors.primaryColor.withValues(alpha: 0.85),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                    ]
                  : null,
            ),
            alignment: Alignment.center,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return ScaleTransition(
                  scale: CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeOutBack,
                  ),
                  child: FadeTransition(opacity: animation, child: child),
                );
              },
              child: isCompleted
                  ? const Icon(
                      Icons.check,
                      key: ValueKey('check_icon'),
                      color: AppColors.white,
                    )
                  : Text(
                      isArabic
                          ? convertToArabicNumber(stepIndex + 1)
                          : '${stepIndex + 1}',
                      key: ValueKey('step_$stepIndex'),
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: isActive
                            ? AppColors.white
                            : isDarkMode
                            ? AppColors.primaryDarkTextColor
                            : AppColors.primaryLightTextColor,
                      ),
                    ),
            ),
          );
        } else {
          int prevStepIndex = i ~/ 2;
          bool isActive = currentStep > prevStepIndex;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            width: AppSize.s60,
            height: 4,
            margin: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.r12),
              gradient: isActive
                  ? LinearGradient(
                      colors: [
                        Theme.of(context).primaryColor.withValues(alpha: 0.1),
                        Theme.of(context).primaryColor,
                      ],
                    )
                  : null,
              color: !isActive
                  ? (isDarkMode
                        ? AppColors.surfaceDarkColor
                        : AppColors.surfaceLightColor)
                  : null,
            ),
          );
        }
      }),
    );
  }
}
