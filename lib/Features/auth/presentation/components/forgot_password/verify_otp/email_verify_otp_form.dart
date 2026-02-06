import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/auth/presentation/cubits/forgot_password_flow/forgot_password_flow_cubit.dart';
import 'package:quent/core/cubits/language_cubit/language_cubit.dart';
import 'package:quent/core/widgets/custom_otp_field.dart';

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
        child: CustomOTPField(
          controller: context.read<ForgotPasswordFlowCubit>().otpController,
          validator: (value) {
            return null;
          },
          onCompleted: (value) =>
              context.read<ForgotPasswordFlowCubit>().verifyOtp(),
        ),
      ),
    );
  }
}
