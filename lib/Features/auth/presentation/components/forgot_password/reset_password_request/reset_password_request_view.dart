import 'package:flutter/material.dart';
import 'package:quent/Features/auth/presentation/components/auth_title_body.dart';
import 'package:quent/Features/auth/presentation/components/forgot_password/reset_password_request/reset_password_request_actions.dart';
import 'package:quent/Features/auth/presentation/components/forgot_password/reset_password_request/reset_password_request_form.dart';
import 'package:quent/core/resources/app_size.dart';
import 'package:quent/generated/l10n.dart';

class ResetPasswordRequestView extends StatelessWidget {
  const ResetPasswordRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .center,
      children: [
        AuthTitleBody(
          title: S.of(context).resetPasswordRequestTitle,
          body: S.of(context).resetPasswordRequestBody,
        ),
        SizedBox(height: AppSize.s32),
        ResetPasswordRequestForm(),
        SizedBox(height: AppSize.s32),
        ResetPasswordRequestActions(),
      ],
    );
  }
}
