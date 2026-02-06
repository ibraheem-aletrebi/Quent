part of 'login_cubit.dart';

sealed class LoginState extends Equatable {

  const LoginState();

  @override
  List<Object?> get props => [];
}

final class LoginInitial extends LoginState {
  const LoginInitial();
}

final class LoginLoading extends LoginState {
  const LoginLoading();
}

final class LoginSuccess extends LoginState {
  
}

final class LoginError extends LoginState {
  final String message;
  const LoginError({required this.message});
}

final class LoginToggleRememberMe extends LoginState {
  final bool rememberMe;
  const LoginToggleRememberMe({required this.rememberMe});
}