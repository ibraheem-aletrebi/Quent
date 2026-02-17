import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:quent/Features/auth/data/repo/signup_repo.dart';
import 'package:quent/core/models/country_model.dart';
import 'package:quent/core/models/location_model.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.repo) : super(SignupInitial());

  final SignupRepo repo;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController nationalIdController = TextEditingController();
  bool addCar = false;
  late CountryModel selectedCountry;
  late LocationModel selectedLocation;
  String? birthDate;
  void selectCountry(CountryModel country) {
    selectedCountry = country;
    countryController.text = country.country;
  }

  void selectLocation(LocationModel location) {
    selectedLocation = location;
    locationController.text = location.name;
  }

  void selectBirthDate(String date) {
    birthDate = date;
  }

  void signup() async {
    emit(SignupLoading());
    await Future.delayed(const Duration(seconds: 4), () {
      emit(SignupSuccess());
    });
  }

  void toggleAddCar() {
    addCar = !addCar;
    emit(SignupToggleCar(addCar: addCar));
  }

  @override
  Future<void> close() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    countryController.dispose();
    locationController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    birthDateController.dispose();
    nationalIdController.dispose();

    return super.close();
  }
}
