import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/auth/presentation/components/forgot_password/forgot_password_flow.dart';
import 'package:quent/Features/auth/presentation/cubits/forgot_password_flow/forgot_password_flow_cubit.dart';

class ForgotPasswordFlowBlocConsumer extends StatelessWidget {
  const ForgotPasswordFlowBlocConsumer({super.key});

  @override
  
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordFlowCubit, ForgotPasswordFlowState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ForgotPasswordFlow();
      },
    );
  }
}
