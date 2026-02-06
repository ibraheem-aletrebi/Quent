part of 'forgot_password_flow_cubit.dart';

sealed class ForgotPasswordFlowState extends Equatable {
  const ForgotPasswordFlowState();

  @override
  List<Object?> get props => [];
}

/// -------------------- Initial --------------------

final class ForgotPasswordInitial extends ForgotPasswordFlowState {}

/// -------------------- Email Verification --------------------

final class EmailVerificationLoading extends ForgotPasswordFlowState {}

final class EmailVerificationSuccess extends ForgotPasswordFlowState {
  final String email;

  const EmailVerificationSuccess(this.email);

  @override
  List<Object?> get props => [email];
}

final class EmailVerificationError extends ForgotPasswordFlowState {
  final String message;

  const EmailVerificationError(this.message);

  @override
  List<Object?> get props => [message];
}

/// -------------------- OTP Verification --------------------

final class OtpVerificationLoading extends ForgotPasswordFlowState {}

final class OtpVerificationSuccess extends ForgotPasswordFlowState {
  final String otp; // or otpId / token if needed

  const OtpVerificationSuccess(this.otp);

  @override
  List<Object?> get props => [otp];
}

final class OtpVerificationError extends ForgotPasswordFlowState {
  final String message;

  const OtpVerificationError(this.message);

  @override
  List<Object?> get props => [message];
}

/// -------------------- Resend OTP --------------------

final class ResendOtpLoading extends ForgotPasswordFlowState {}

final class ResendOtpSuccess extends ForgotPasswordFlowState {
  final String otp; // or otpId / token

  const ResendOtpSuccess(this.otp);

  @override
  List<Object?> get props => [otp];
}

final class ResendOtpError extends ForgotPasswordFlowState {
  final String message;

  const ResendOtpError(this.message);

  @override
  List<Object?> get props => [message];
}

/// -------------------- Reset Password --------------------

final class ResetPasswordLoading extends ForgotPasswordFlowState {}

final class ResetPasswordSuccess extends ForgotPasswordFlowState {}

final class ResetPasswordError extends ForgotPasswordFlowState {
  final String message;

  const ResetPasswordError(this.message);

  @override
  List<Object?> get props => [message];
}

