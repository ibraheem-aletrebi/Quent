import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/auth/presentation/components/sign_up/signup_view_body.dart';
import 'package:quent/Features/auth/presentation/cubits/signup/signup_cubit.dart';
import 'package:quent/Features/auth/presentation/views/phone_verification_view.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
            Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => PhoneVerificationView()),
          );
        }
        },
      builder: (context, state) {
        return SignupViewBody();
      },
    );
  }
}
