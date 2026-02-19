part of 'signup_cubit.dart';

sealed class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object?> get props => [];
}

final class SignupInitial extends SignupState {
  final bool addCar;
  const SignupInitial({this.addCar = false});

  SignupInitial copyWith({bool? addCar}) {
    return SignupInitial(addCar: addCar ?? this.addCar);
  }

  @override
  List<Object?> get props => [addCar];
}

final class SignupLoading extends SignupState {
  const SignupLoading();
}

final class SignupSuccess extends SignupState {
  final SignupResponseModel signupResponseModel;

  const SignupSuccess({required this.signupResponseModel});

  @override
  List<Object?> get props => [signupResponseModel];
}

final class SignupFailure extends SignupState {
  final ApiErrorModel error;

  const SignupFailure({required this.error});

  @override
  List<Object?> get props => [error];
}

final class SignupToggleCar extends SignupState {
  final bool addCar;

  const SignupToggleCar({required this.addCar});

  @override
  List<Object?> get props => [addCar];
}

final class SignupValidationFailed extends SignupState {
  const SignupValidationFailed();
}
