import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/auth/presentation/components/auth_action_promp.dart';
import 'package:quent/Features/auth/presentation/components/sign_up/signup_view_body_bloc_consumer.dart';
import 'package:quent/Features/auth/presentation/cubits/signup/signup_cubit.dart';
import 'package:quent/core/extensions/navigation_extension.dart';
import 'package:quent/generated/l10n.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignupCubit>(
      create: (context) => SignupCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(child: SignupViewBodyBlocConsumer()),

        bottomNavigationBar: AuthActionPrompt(
          leadingText: S.of(context).alreadyHaveAccount,
          actionText: S.of(context).login,
          onActionTap: () {
            context.pop();
          },
        ),
      ),
    );
  }
}
