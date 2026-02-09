import 'package:flutter/material.dart';
import 'package:quent/core/resources/app_border.dart';
import 'package:quent/core/resources/app_color.dart';

class NavItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.white.withValues(alpha: 0.2)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(AppBorder.b12),
        ),
        child: AnimatedScale(
          scale: isSelected ? 1.2 : 1.1,
          duration: const Duration(milliseconds: 300),
          child: Icon(
            icon,
            size: 24,
            color: isSelected ? AppColors.white : AppColors.secondaryColor,
          ),
        ),
      ),
    );
  }
}
