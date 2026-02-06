import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/auth/presentation/components/sign_up/yes_no_option.dart';
import 'package:quent/Features/auth/presentation/cubits/signup/signup_cubit.dart';
import 'package:quent/core/resources/app_size.dart';
import 'package:quent/core/widgets/custom_text_form_field.dart';
import 'package:quent/generated/l10n.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            spacing: AppSize.s16,
            children: [
              Expanded(
                child: CustomTextFormField(hintText: S.of(context).FirstName),
              ),
              Expanded(
                child: CustomTextFormField(hintText: S.of(context).LastName),
              ),
            ],
          ),
          SizedBox(height: AppSize.s16),
          CustomTextFormField(hintText: S.of(context).email),
          SizedBox(height: AppSize.s16),
          CustomTextFormField(hintText: S.of(context).PhoneNumber),

          SizedBox(height: AppSize.s16),
          CustomTextFormField(hintText: S.of(context).city),
          SizedBox(height: AppSize.s16),
          CustomTextFormField(hintText: S.of(context).location),
          SizedBox(height: AppSize.s16),
          CustomTextFormField(
            hintText: S.of(context).password,
            isPassword: true,
          ),
          SizedBox(height: AppSize.s16),
          CustomTextFormField(
            hintText: S.of(context).ConfirmPassword,
            isPassword: true,
          ),
          SizedBox(height: AppSize.s16),
          BlocSelector<SignupCubit, SignupState, bool>(
            selector: (state) => state.addCar!,
            builder: (context, state) {
              return YesNoOption(
                label: S.of(context).availableToAddCar,
                value: context.watch<SignupCubit>().addCar,
                onChanged: (value) {
                  context.read<SignupCubit>().toggleAddCar();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
