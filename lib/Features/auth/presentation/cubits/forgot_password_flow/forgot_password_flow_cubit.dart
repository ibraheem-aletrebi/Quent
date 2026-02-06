import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/auth/presentation/components/forgot_password/reset_new_password/reset_new_password_view.dart';
import 'package:quent/Features/auth/presentation/components/forgot_password/verify_otp/reset_password_otp_view.dart';
import 'package:quent/Features/auth/presentation/components/forgot_password/reset_password_request/reset_password_request_view.dart';

part 'forgot_password_flow_state.dart';

class ForgotPasswordFlowCubit extends Cubit<ForgotPasswordFlowState> {
  ForgotPasswordFlowCubit() : super(ForgotPasswordInitial());

  final emailController = TextEditingController();
  final otpController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final PageController pageController = PageController();
  int currentStep = 0;

  final GlobalKey<FormState> resetPasswordRequestFormKey =
      GlobalKey<FormState>();
  final GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();

  final List<Widget> steps = [
    const ResetPasswordRequestView(),
    const ResetPasswordOtpView(),
    const ResetNewPasswordView(),
  ];
  int get numberOfSteps => steps.length;
  void _goToNext() {
    pageController.animateToPage(
      ++currentStep,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  /// -------------------- Email Verification --------------------

  void verifyEmail() {
    emit(EmailVerificationLoading());
    emit(EmailVerificationSuccess(emailController.text));
    _goToNext();

  }

  /// -------------------- OTP Verification --------------------

  void verifyOtp() {
    emit(OtpVerificationLoading());

    emit(OtpVerificationSuccess(otpController.text));
    _goToNext();

  
  }

  /// -------------------- Resend OTP --------------------

  void resendOtp() {
    emit(ResendOtpLoading());

    emit(ResendOtpSuccess(otpController.text));
  }

  /// -------------------- Reset Password --------------------

  void resetPassword() {
    emit(ResetPasswordLoading());
    emit(ResetPasswordSuccess());
  }

  /// -------------------- Reset Flow --------------------

  void resetFlow() {
    currentStep = 0;
    pageController.jumpToPage(0);

    emailController.clear();
    otpController.clear();
    passwordController.clear();
    confirmPasswordController.clear();

    emit(ForgotPasswordInitial());
  }

  @override
  Future<void> close() {
    emailController.dispose();
    otpController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    pageController.dispose();
    return super.close();
  }
}
