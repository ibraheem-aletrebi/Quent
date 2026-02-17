import 'package:flutter/material.dart';
import 'package:quent/core/resources/app_size.dart';
import 'package:quent/core/widgets/custom_text_form_field.dart';
import 'package:quent/generated/l10n.dart';

class SignupPasswordFields extends StatelessWidget {
  const SignupPasswordFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppSize.s16,
      children: [
        Expanded(
          child: CustomTextFormField(
            hintText: S.of(context).password,
            isPassword: true,
          ),
        ),
        Expanded(
          child: CustomTextFormField(
            hintText: S.of(context).ConfirmPassword,
            isPassword: true,
          ),
        ),
      ],
    );
  }
}
