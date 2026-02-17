import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/auth/presentation/components/sign_up/add_car_avilability_section.dart';
import 'package:quent/Features/auth/presentation/components/sign_up/country_location_selector.dart';
import 'package:quent/Features/auth/presentation/components/sign_up/signup_password_fields.dart';
import 'package:quent/core/widgets/custom_text_form_field.dart';
import 'package:quent/generated/l10n.dart';
import 'package:quent/core/resources/app_size.dart';
import 'package:quent/Features/auth/presentation/cubits/signup/signup_cubit.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
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
          CountryLocationSelector(),
          SizedBox(height: AppSize.s16),
          SignupPasswordFields(),
          SizedBox(height: AppSize.s16),
          AddCarAvilabilitySection(),
        ],
      ),
    );
  }
}
