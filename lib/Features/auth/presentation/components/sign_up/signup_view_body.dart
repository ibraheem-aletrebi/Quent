import 'package:flutter/material.dart';
import 'package:quent/Features/auth/presentation/components/sign_up/signup_actions.dart';
import 'package:quent/Features/auth/presentation/components/sign_up/signup_form.dart';
import 'package:quent/core/resources/app_padding.dart';
import 'package:quent/core/resources/app_size.dart';
import 'package:quent/core/widgets/custom_logo.dart';
import 'package:quent/generated/l10n.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppPadding.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomLogo(),
          SizedBox(height: AppSize.s32),
          Text(
            S.of(context).signupTitle,
            style: Theme.of(
              context,
            ).textTheme.displayMedium?.copyWith(height: 1.2),
          ),
          SizedBox(height: AppSize.s32),
          SignupForm(),
          SizedBox(height: AppSize.s32),
          SignupActions(),
        ],
      ),
    );
  }
}
