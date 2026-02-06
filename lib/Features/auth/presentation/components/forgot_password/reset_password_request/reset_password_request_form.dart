import 'package:flutter/material.dart';
import 'package:quent/core/widgets/custom_text_form_field.dart';
import 'package:quent/generated/l10n.dart';

class ResetPasswordRequestForm extends StatelessWidget {
  const ResetPasswordRequestForm({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: S.of(context).email,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).emailRequired;
        }
        if (!value.contains('@')) {
          return S.of(context).invalidEmail;
        }
        return null;
      },
    );
  }
}
