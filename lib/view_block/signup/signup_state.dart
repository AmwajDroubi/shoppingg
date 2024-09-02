// part of 'signup_cubit.dart';

// @immutable
// sealed class SignupState {}

// final class SignupInitial extends SignupState {}
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {}

class SignUpFailure extends SignUpState {
  final String message;
  SignUpFailure(this.message);
}
