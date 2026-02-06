import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/core/cubits/language_cubit/language_cubit.dart';
import 'package:quent/core/widgets/custom_otp_field.dart';

class PhoneVerificationForm extends StatelessWidget {
  const PhoneVerificationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Directionality(
        textDirection: context.watch<LanguageCubit>().isArabic()
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: CustomOTPField(
          controller: TextEditingController(),
          length: 6,
          validator: (value) {
            return null;
          },
          onCompleted: (value) {},
        ),
      ),
    );
  }
}
