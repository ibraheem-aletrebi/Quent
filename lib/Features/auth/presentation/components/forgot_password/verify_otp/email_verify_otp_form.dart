import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/auth/presentation/cubits/forgot_password_flow/forgot_password_flow_cubit.dart';
import 'package:quent/core/cubits/language_cubit/language_cubit.dart';
import 'package:quent/core/utils/form_validators.dart';
import 'package:quent/core/widgets/custom_otp_field.dart';
import 'package:quent/generated/l10n.dart';

class EmailVerifyOtpForm extends StatelessWidget {
  const EmailVerifyOtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ForgotPasswordFlowCubit>().otpFormKey,
      child: Directionality(
        textDirection: context.watch<LanguageCubit>().isArabic()
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: Center(
          child: CustomOTPField(
            controller: context.read<ForgotPasswordFlowCubit>().otpController,
            validator: (value) => FormValidators.otpEmailVerify(
              value,
              S.of(context).otpEmailRequired,
              S.of(context).otpValidation,
            ),
            onCompleted: (value) =>
                context.read<ForgotPasswordFlowCubit>().verifyOtp(),
          ),
        ),
      ),
    );
  }
}
