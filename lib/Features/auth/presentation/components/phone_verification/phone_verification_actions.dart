import 'package:flutter/material.dart';
import 'package:quent/Features/auth/presentation/components/resend_otp_button.dart';
import 'package:quent/core/resources/app_color.dart';
import 'package:quent/core/resources/app_size.dart';
import 'package:quent/core/widgets/custom_button.dart';
import 'package:quent/generated/l10n.dart';

class PhoneVerificationActions extends StatelessWidget {
  const PhoneVerificationActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ResendOtpButton(
          resendText: S.of(context).phoneVerificationResend,
          onResend: () {},
        ),
        SizedBox(height: AppSize.s16),
        CustomButton(text: S.of(context).next, onPressed: () {}),
        SizedBox(height: AppSize.s16),
        CustomButton(
          borderColor: AppColors.primaryColor,
          textColor: AppColors.primaryColor,
          backgroundColor: AppColors.transparent,
          text: S.of(context).skipForNow,
          onPressed: () {},
        ),
      ],
    );
  }
}
