import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/auth/data/repo/signup_repo.dart';
import 'package:quent/core/di/services_locator.dart';
import 'package:quent/core/utils/country_code_to_flag.dart';
import 'package:quent/core/widgets/paginated_search_dropdown/cubit/paginated_dropdown_cubit.dart';
import 'package:quent/core/models/country_model.dart';
import 'package:quent/core/widgets/paginated_search_dropdown/paginated_search_dropdown.dart';
import 'package:quent/core/widgets/custom_text_form_field.dart';
import 'package:quent/generated/l10n.dart';
import 'package:quent/core/resources/app_size.dart';
import 'package:quent/Features/auth/presentation/components/sign_up/yes_no_option.dart';
import 'package:quent/Features/auth/presentation/cubits/signup/signup_cubit.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final PaginatedDropdownCubit<CountryModel> _countryCubit;

  @override
  void initState() {
    super.initState();
    _countryCubit = PaginatedDropdownCubit<CountryModel>(
      searchDelay: const Duration(milliseconds: 500),
      fetchData: sl<SignupRepo>().fetchCountries,
    );
  }

  @override
  void dispose() {
    _countryCubit.close();
    super.dispose();
  }

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

          PaginatedSearchDropdown<CountryModel>(
            title: S.of(context).selectCountry,
            cubit: _countryCubit,
            itemAsString: (country) => country.country,
            itemBuilder: (context, item, isSelected) {
              return ListTile(
                leading: Text(countryCodeToFlag(item.abbreviation)),
                title: Text(item.country),
                trailing: isSelected ? const Icon(Icons.check) : null,
              );
            },
            onSelecte: (country) {
              context.read<SignupCubit>().selectedCountry = country;
            },
          ),

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
            selector: (state) => state.addCar ?? false,
            builder: (context, addCar) {
              return YesNoOption(
                label: S.of(context).availableToAddCar,
                value: addCar,
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
