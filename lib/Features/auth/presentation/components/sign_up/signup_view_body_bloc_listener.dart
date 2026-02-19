import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/auth/presentation/components/sign_up/signup_view_body.dart';
import 'package:quent/Features/auth/presentation/cubits/signup/signup_cubit.dart';
import 'package:quent/core/extensions/navigation_extension.dart';
import 'package:quent/core/extensions/snack_bar_extenstion.dart';
import 'package:quent/core/routing/app_route.dart';
import 'package:quent/core/widgets/custom_snack_bar.dart';

class SignupViewBodyBlocListener extends StatelessWidget {
  const SignupViewBodyBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignUpSuccessAndPhoneVerifyCodeSent) {
          context.pushReplacementNamed(
            AppRoutes.phoneVerification,
            arguments: context.read<SignupCubit>().phoneController.text,
          );
          context.showSnackbar(
            state.verifyPhoneResponseModel.code,
            type: SnackbarType.success,
            showCloseButton: true,
          );
        }
        if (state is SignupFailure) {
          context.showSnackbar(state.error.message, type: SnackbarType.error);
        }
      },

      child: const SignupViewBody(),
    );
  }
}
