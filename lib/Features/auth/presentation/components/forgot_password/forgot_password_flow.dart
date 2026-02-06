import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/auth/presentation/components/forgot_password/reset_password_steps_indicator.dart';
import 'package:quent/Features/auth/presentation/cubits/forgot_password_flow/forgot_password_flow_cubit.dart';

class ForgotPasswordFlow extends StatelessWidget {
  const ForgotPasswordFlow({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ForgotPasswordFlowCubit>();
    return Column(
      children: [
        ResetPasswordStepsIndicator(
          currentStep: controller.currentStep,
          numberOfSteps: controller.numberOfSteps,
        ),
        const SizedBox(height: 16),
        Expanded(
          child: PageView.builder(
            controller: controller.pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.numberOfSteps,
            itemBuilder: (context, index) => controller.steps[index],
          ),
        ),
      ],
    );
  }
}
