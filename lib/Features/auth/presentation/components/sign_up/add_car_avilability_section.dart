import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/auth/presentation/components/sign_up/custom_date_time_field.dart';
import 'package:quent/Features/auth/presentation/components/sign_up/yes_no_option.dart';
import 'package:quent/Features/auth/presentation/cubits/signup/signup_cubit.dart';
import 'package:quent/core/resources/app_size.dart';
import 'package:quent/core/widgets/custom_text_form_field.dart';
import 'package:quent/generated/l10n.dart';

class AddCarAvilabilitySection extends StatelessWidget {
  const AddCarAvilabilitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SignupCubit, SignupState, bool>(
      selector: (state) => state.addCar!,
      builder: (context, addCar) {
        return Column(
          children: [
            YesNoOption(
              label: S.of(context).availableToAddCar,
              value: addCar,
              onChanged: (value) {
                context.read<SignupCubit>().toggleAddCar();
              },
            ),
            Visibility(
              visible: context.watch<SignupCubit>().addCar,
              child: Column(
                children: [
                  SizedBox(height: AppSize.s16),
                  CustomTextFormField(hintText: S.of(context).nationalId),
                  SizedBox(height: AppSize.s16),
                  CustomDatePickerField(
                    hintText: S.of(context).birthDate,
                    lastDate: DateTime.now(),
                    onDateSelected: (birthDate) {
                      context.read<SignupCubit>().selectBirthDate(
                        birthDate.toString(),
                      );
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).birthDateRequired;
                      }

                      DateTime? birthDate;

                      try {
                        birthDate = DateTime.parse(value);
                      } catch (e) {
                        return S.of(context).invalidDateFormat;
                      }

                      final today = DateTime.now();

                      int age = today.year - birthDate.year;

                      if (today.month < birthDate.month ||
                          (today.month == birthDate.month &&
                              today.day < birthDate.day)) {
                        age--;
                      }
                      if (age < 18) {
                        return S.of(context).ageRestriction;
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
