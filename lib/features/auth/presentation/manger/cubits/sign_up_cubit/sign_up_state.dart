part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignupLoading extends SignUpState {}

final class SignupSuccess extends SignUpState {
  final UserEntity userEntity;
  SignupSuccess({required this.userEntity});
}

final class SignupFailure extends SignUpState {
  final String errMessage;

  SignupFailure({required this.errMessage});
}
