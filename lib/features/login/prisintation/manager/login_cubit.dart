import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1_cubit/features/login/repo/logen_repo.dart';
import 'package:task1_cubit/features/register/data/local/user_local_storage.dart';
import 'dart:developer' as developer;
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final email = TextEditingController();
  final password = TextEditingController();
  final UserLocalStorage _localStorage = UserLocalStorage();
  final LoginRepo _api = LoginRepo();
  @override
  Future<void> close() {
    email.dispose();
    // user.dispose();
    password.dispose();
    return super.close();
  }

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());

    final user = await _api.loginUser(email, password);
    developer.log('Login response: $user', name: 'LoginCubit');
    await _localStorage.saveUser(
      id: user['user']['id'],
      name:user['user']['name'],
      lastName: 'lastname',
      email: user['user']['email'],
      password: password,
    );
  }

  void validateFields({required String email, required String password}) async {
    emit(LoginInitial());

    if (email.isEmpty) {
      emit(LoginFieldError(field: "email", message: "Email is required"));
      return;
    }
    if (!email.contains("@")) {
      emit(LoginFieldError(field: "email", message: "Invalid email"));
      return;
    }
    if (password.isEmpty) {
      emit(LoginFieldError(field: "password", message: "Password is required"));
      return;
    }
    if (password.length < 6) {
      emit(LoginFieldError(field: "password", message: "Password too short"));
      return;
    }
    try {
      await login(email: email, password: password);
    } catch (e, stackTrace) {
      developer.log(
        'Login error: $e',
        name: 'LoginCubit',
        error: e,
        stackTrace: stackTrace,
      );
      emit(
        LoginFieldError(
          field: "server",
          message: "check internet conecting or data input",
        ),
      );
      return;
    }
    // print(user);

    emit(LoginSuccess());
  }
}
