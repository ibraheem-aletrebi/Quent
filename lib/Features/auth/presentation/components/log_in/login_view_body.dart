import 'package:flutter/material.dart';
import 'package:quent/Features/auth/presentation/components/log_in/login_actions.dart';
import 'package:quent/Features/auth/presentation/components/log_in/login_form.dart';
import 'package:quent/Features/auth/presentation/components/log_in/remember_me_and_forgot_password.dart';
import 'package:quent/core/resources/app_padding.dart';
import 'package:quent/core/resources/app_size.dart';
import 'package:quent/core/widgets/theme_language_switcher.dart';
import 'package:quent/generated/l10n.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppPadding.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ThemeLanguageSwitcher(),
          SizedBox(height: AppSize.s32),
          Text(
            S.of(context).loginTitle,
            style: Theme.of(
              context,
            ).textTheme.displayMedium?.copyWith(height: 1.2),
          ),
          SizedBox(height: AppSize.s32),
          const LoginForm(),
          SizedBox(height: AppSize.s16),
          const RememberMeAndForgotPassword(),
          SizedBox(height: AppSize.s32),
          LoginActions(),
        ],
      ),
    );
  }
}
