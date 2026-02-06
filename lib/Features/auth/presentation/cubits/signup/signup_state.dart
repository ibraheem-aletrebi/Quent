part of 'signup_cubit.dart';

sealed class SignupState extends Equatable {
  final bool? addCar;
  final bool isLoading;
  final String? errorMessage;

  const SignupState({
    this.addCar = false,
    this.isLoading = false,
    this.errorMessage,
  });

  SignupState copyWith({bool? addCar, bool? isLoading, String? errorMessage}) {
    return SignupInitial(
      addCar: addCar ?? this.addCar,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [addCar, isLoading, errorMessage];
}

final class SignupInitial extends SignupState {
  const SignupInitial({
    super.addCar,
    super.isLoading,
    super.errorMessage,
  });
}

final class SignupLoading extends SignupState {
  const SignupLoading()
      : super(isLoading: true);
}

final class SignupSuccess extends SignupState {
  const SignupSuccess();
}

final class SignupFailure extends SignupState {
  const SignupFailure({
    required String message,
    required super.addCar,
  }) : super(
          errorMessage: message,
        );
}

final class SignupToggleCar extends SignupState {
  const SignupToggleCar({
    required bool addCar,
  }) : super(
          addCar: addCar,
        );
}