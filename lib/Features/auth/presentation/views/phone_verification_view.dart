import 'package:flutter/material.dart';
import 'package:quent/Features/auth/presentation/components/phone_verification/phone_verification_view_body.dart';

class PhoneVerificationView extends StatelessWidget {
  const PhoneVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(child: PhoneVerificationViewBody()),
    );
  }
}
