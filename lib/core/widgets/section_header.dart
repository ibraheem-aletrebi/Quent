import 'package:flutter/material.dart';
import 'package:quent/core/resources/app_color.dart';
import 'package:quent/core/resources/app_padding.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String actionText;
  final VoidCallback? onActionTap;
  final EdgeInsets? padding;

  const SectionHeader({
    super.key,
    required this.title,
    this.actionText = 'See all',
    this.onActionTap,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding:
          padding ??
          EdgeInsets.symmetric(
            horizontal: AppPadding.p16,
            vertical: AppPadding.p4,
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: theme.textTheme.titleMedium),
          if (onActionTap != null)
            TextButton(
              onPressed: onActionTap,
              style: TextButton.styleFrom(
                foregroundColor: AppColors.secondaryColor,
                padding: EdgeInsets.zero,
                minimumSize: const Size(48, 36),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                actionText,
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
