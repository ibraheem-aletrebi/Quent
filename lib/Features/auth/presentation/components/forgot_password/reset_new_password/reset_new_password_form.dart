import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/auth/presentation/cubits/forgot_password_flow/forgot_password_flow_cubit.dart';
import 'package:quent/core/resources/app_size.dart';
import 'package:quent/core/widgets/custom_text_form_field.dart';
import 'package:quent/generated/l10n.dart';

class ResetNewPasswordForm extends StatelessWidget {
  const ResetNewPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.watch<ForgotPasswordFlowCubit>().resetPasswordFormKey,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: S.of(context).newPassword,
            isPassword: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).newPasswordRequired;
              }
              if (value.length < 6) {
                return S.of(context).passwordTooShort;
              }
              return null;
            },
          ),
          SizedBox(height: AppSize.s16),
          CustomTextFormField(
            hintText: S.of(context).confirmPassword,
            isPassword: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).confirmPasswordRequired;
              }

              return null;
            },
          ),
        ],
      ),
    );
  }
}
