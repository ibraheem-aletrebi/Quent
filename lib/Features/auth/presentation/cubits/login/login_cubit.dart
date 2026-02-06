import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void login() async {
    emit(LoginLoading());
    await Future.delayed(const Duration(seconds: 4), () {
      emit(LoginSuccess());
    });
  }

  void toggleRememberMe(bool value) {
    rememberMe = value;
    emit(LoginToggleRememberMe(rememberMe: value));
  }

  @override
  Future<void> close() async {
    emailController.dispose();
    passwordController.dispose();
    await super.close();
  }
}
