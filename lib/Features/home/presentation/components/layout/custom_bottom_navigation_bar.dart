import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/home/presentation/components/layout/nav_item.dart';
import 'package:quent/Features/home/presentation/cubits/layout/layout_cubit.dart';
import 'package:quent/core/cubits/theme_cubit/theme_cubit.dart';
import 'package:quent/core/resources/app_border.dart';
import 'package:quent/core/resources/app_color.dart';
import 'package:quent/core/resources/app_padding.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<ThemeCubit>().isDarkMode;

    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        final layoutCubit = context.read<LayoutCubit>();
        final currentIndex = layoutCubit.currentIndex;

        return ClipRRect(
          borderRadius: BorderRadius.circular(AppBorder.b24),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 5),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p16,
                vertical: AppPadding.p12,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppBorder.b24),
                gradient: LinearGradient(
                  colors: isDarkMode
                      ? [
                          AppColors.white.withValues(alpha: 0.02),
                          AppColors.white.withValues(alpha: 0.01),
                        ]
                      : [
                          AppColors.black.withValues(alpha: 0.5),
                          AppColors.black.withValues(alpha: 0.2),
                        ],
                ),
                border: Border.all(
                  color: AppColors.white.withValues(alpha: 0.2),
                  width: 1.2,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  layoutCubit.bottomNavIcons.length,
                  (index) => NavItem(
                    icon: layoutCubit.bottomNavIcons[index],
                    isSelected: index == currentIndex,
                    onTap: () {
                      HapticFeedback.lightImpact();
                      layoutCubit.changeIndex(index);
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
