import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/auth/presentation/components/forgot_password/forgot_password_flow.dart';
import 'package:quent/Features/auth/presentation/cubits/forgot_password_flow/forgot_password_flow_cubit.dart';
import 'package:quent/core/extensions/navigation_extension.dart';
import 'package:quent/core/extensions/snack_bar_extenstion.dart';
import 'package:quent/core/routing/app_route.dart';
import 'package:quent/core/widgets/custom_snack_bar.dart';
import 'package:quent/generated/l10n.dart';

class ForgotPasswordFlowBlocListener extends StatelessWidget {
  const ForgotPasswordFlowBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordFlowCubit, ForgotPasswordFlowState>(
      listener: (context, state) {
        if (state is Failure) {
          context.showSnackbar(state.error.message, type: SnackbarType.error);
        }
        if (state is OtpVerificationError) {
          context.showSnackbar(
            S.of(context).otpIsNotCorrect,
            type: SnackbarType.error,
          );
        }
        if (state is ResetPasswordSuccess) {
          context.showSnackbar(
            S.of(context).passwordChangedSuccessfully,
            type: SnackbarType.success,
          );
          context.pushReplacementNamed(AppRoutes.login);
        }
      },
      child: ForgotPasswordFlow(),
    );
  }
}
