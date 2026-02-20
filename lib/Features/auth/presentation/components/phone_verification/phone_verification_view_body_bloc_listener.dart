import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/auth/presentation/components/phone_verification/phone_verification_view_body.dart';
import 'package:quent/Features/auth/presentation/cubits/phone_verify/phone_verify_cubit.dart';
import 'package:quent/core/extensions/navigation_extension.dart';
import 'package:quent/core/extensions/snack_bar_extenstion.dart';
import 'package:quent/core/routing/app_route.dart';
import 'package:quent/core/widgets/custom_snack_bar.dart';
import 'package:quent/generated/l10n.dart';

class PhoneVerificationViewBodyBlocListener extends StatelessWidget {
  const PhoneVerificationViewBodyBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PhoneVerifyCubit, PhoneVerifyState>(
      listener: (context, state) {
        if (state is PhoneVerifyCodeVerified) {
          context.showSnackbar(
            state.phoneVerifiedResponseModel.message,
            type: SnackbarType.success,
            
          );
          context.pushReplacementNamed(AppRoutes.main);
        }
        if (state is PhoneVerifyResendCode) {
          context.showSnackbar(
            state.verifyPhoneResponseModel.code,
            type: SnackbarType.success,
            duration: Duration(seconds: 30),
            actionLabel: S.of(context).copy,
            onAction: () {
              Clipboard.setData(
                ClipboardData(text: state.verifyPhoneResponseModel.code),
              );
            },
          );
        }
        if (state is PhoneVerifyError) {
          context.showSnackbar(
            state.errorModel.message,
            type: SnackbarType.error,
          );
        }
      },
      child: const PhoneVerificationViewBody(),
    );
  }
}
