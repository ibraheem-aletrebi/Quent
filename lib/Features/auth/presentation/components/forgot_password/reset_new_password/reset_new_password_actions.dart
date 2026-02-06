import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/auth/presentation/cubits/forgot_password_flow/forgot_password_flow_cubit.dart';
import 'package:quent/core/widgets/custom_button.dart';
import 'package:quent/generated/l10n.dart';

class ResetNewPasswordActions extends StatelessWidget {
  const ResetNewPasswordActions({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgotPasswordFlowCubit>();
    return CustomButton(
      text: S.of(context).submit,
      onPressed: cubit.resetPassword,
    );
  }
}
