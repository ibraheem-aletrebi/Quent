import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/auth/presentation/components/sign_up/signup_view_body.dart';
import 'package:quent/Features/auth/presentation/cubits/signup/signup_cubit.dart';
import 'package:quent/Features/auth/presentation/views/phone_verification_view.dart';
import 'package:quent/core/extensions/snack_bar_extenstion.dart';
import 'package:quent/core/widgets/custom_snack_bar.dart';
import 'package:quent/generated/l10n.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          context.showSnackbar(
            S.of(context).signupSuccess,
            type: SnackbarType.success,
          );
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => PhoneVerificationView()),
          );
        }
        if (state is SignupFailure) {
          context.showSnackbar(state.error.message, type: SnackbarType.error);
        }
      },
      builder: (context, state) {
        return SignupViewBody();
      },
    );
  }
}
