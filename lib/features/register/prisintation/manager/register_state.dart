
part of 'register_cubit.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}
class RegisterSuccessSaveUser extends RegisterState {}
class RegisterSuccessServer extends RegisterState {}
class RegisterFieldError extends RegisterState {
  final String field;   // email /   first / last / password
  final String message;

  RegisterFieldError({
    required this.field,
    required this.message,
  });
}
