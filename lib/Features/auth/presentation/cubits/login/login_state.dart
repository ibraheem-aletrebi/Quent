part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  final bool rememberMe;
  final bool isLoading;
  final String? errorMessage;

  const LoginState({
    this.rememberMe = false,
    this.isLoading = false,
    this.errorMessage,
  });

  LoginState copyWith({
    bool? rememberMe,
    bool? isLoading,
    String? errorMessage,
  }) {
    return LoginInitial(
      rememberMe: rememberMe ?? this.rememberMe,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [rememberMe, isLoading, errorMessage];
}

final class LoginInitial extends LoginState {
  const LoginInitial({
    super.rememberMe,
    super.isLoading,
    super.errorMessage,
  });
}

final class LoginLoading extends LoginState {
  const LoginLoading({super.rememberMe})
      : super(isLoading: true);
}

final class LoginSuccess extends LoginState {
  
}

final class LoginError extends LoginState {
  const LoginError({required String message})
      : super(errorMessage: message, isLoading: false);
}
