import 'package:flutter/material.dart';
import 'package:quent/Features/auth/presentation/components/auth_title_body.dart';
import 'package:quent/Features/auth/presentation/components/phone_verification/phone_verification_actions.dart';
import 'package:quent/Features/auth/presentation/components/phone_verification/phone_verification_form.dart';
import 'package:quent/core/resources/app_padding.dart';
import 'package:quent/core/resources/app_size.dart';
import 'package:quent/generated/l10n.dart';

class PhoneVerificationViewBody extends StatelessWidget {
  const PhoneVerificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          padding: EdgeInsets.all(AppPadding.p16),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight:
              MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top -
              kToolbarHeight,
        ),
        child: IntrinsicHeight(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AuthTitleBody(
                title: S.of(context).phoneVerificationtitle,
                body: S.of(context).phoneVerificationBody,
              ),
              SizedBox(height: AppSize.s32),
              PhoneVerificationForm(),
              SizedBox(height: AppSize.s32),
              PhoneVerificationActions(),
            ],
          ),
        ),
      ),
    );
  }
}
