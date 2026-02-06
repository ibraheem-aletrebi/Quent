import 'package:flutter/material.dart';
import 'package:quent/core/resources/app_size.dart';

class AuthActionPrompt extends StatelessWidget {
  final String leadingText;
  final String actionText;
  final VoidCallback? onActionTap;
  final TextStyle? leadingStyle;
  final TextStyle? actionStyle;

  const AuthActionPrompt({
    super.key,
    required this.leadingText,
    required this.actionText,
    this.onActionTap,
    this.leadingStyle,
    this.actionStyle,
  });

  @override
  Widget build(BuildContext context) {
    final defaultLeadingStyle =
        leadingStyle ?? Theme.of(context).textTheme.displaySmall;
    final defaultActionStyle =
        actionStyle ??
        Theme.of(context).textTheme.displaySmall?.copyWith(
          color: Theme.of(context).primaryColor,
        );
    return SizedBox(
      height: AppSize.s65,
      child: Center(
        child: GestureDetector(
          onTap: onActionTap,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: leadingText, style: defaultLeadingStyle),
                WidgetSpan(child: SizedBox(width: AppSize.s8)),
                TextSpan(text: actionText, style: defaultActionStyle),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
