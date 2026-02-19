import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/auth/presentation/cubits/phone_verify/phone_verify_cubit.dart';
import 'package:quent/core/cubits/language_cubit/language_cubit.dart';
import 'package:quent/core/utils/form_validators.dart';
import 'package:quent/core/widgets/custom_otp_field.dart';
import 'package:quent/generated/l10n.dart';

class PhoneVerificationForm extends StatelessWidget {
  const PhoneVerificationForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<PhoneVerifyCubit>();
    return Form(
      key: controller.formKey,
      child: Directionality(
        textDirection: context.watch<LanguageCubit>().isArabic()
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: CustomOTPField(
          controller: controller.otpController,
          length: 4,
          validator: (value) => FormValidators.otpPhoneVerify(
            value,
            S.of(context).otpPhoneRequired,
            S.of(context).otpValidation,
          ),
          onCompleted: (value) {
            controller.verifyPhoneConfirm();
          },
        ),
      ),
    );
  }
}
