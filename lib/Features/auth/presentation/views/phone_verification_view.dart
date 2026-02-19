import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/auth/presentation/components/phone_verification/phone_verification_view_body_bloc_listener.dart';
import 'package:quent/Features/auth/presentation/cubits/phone_verify/phone_verify_cubit.dart';
import 'package:quent/core/di/services_locator.dart';

class PhoneVerificationView extends StatelessWidget {
  const PhoneVerificationView({super.key, required this.phone});
  final String phone;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PhoneVerifyCubit>(
      create: (context) => sl<PhoneVerifyCubit>()..setPhone(phone),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(child: PhoneVerificationViewBodyBlocListener()),
      ),
    );
  }
}
