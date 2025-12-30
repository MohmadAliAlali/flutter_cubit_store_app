// import 'package:flutter_bloc/flutter_bloc.dart';
// part 'settings_state.dart';

// class SettingsCubit extends Cubit<SettingsState> {
//   SettingsCubit() : super(SettingsInitial());

//   String mode = 'system';
//   String language = "en";

// }


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1_cubit/features/settings/repo/delete_repo.dart';
import 'package:task1_cubit/features/settings/repo/logout_repo.dart';
part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  ThemeMode themeMode = ThemeMode.light;
  String themeLanguag = "arabic";
  final LogoutRepo _api = LogoutRepo();
  final DeleteRepo _deleteApi = DeleteRepo();
  void changeMode({required ThemeMode mode}) {
    if (mode == ThemeMode.dark) {
      themeMode = ThemeMode.dark;
      emit(ChangeMode(mode: "dark"));
      return;
    }

    if (mode == ThemeMode.light) {
      themeMode = ThemeMode.light;
      emit(ChangeMode(mode: "light"));
      return;
    }

    if (mode == ThemeMode.system) {
      themeMode = ThemeMode.system;
      emit(ChangeMode(mode: "system"));
      return;
    }
  }

  Future<void> logout() async {
    emit(LogoutLoading());
    var data = await _api.logout();

    if (data) {
      emit(LogoutSuccses());
    }
    emit(LogoutFieldError(field: 'error', message: 'logout fiald'));
  }
  Future<void> delete() async {
    emit(LogoutLoading());
    var data = await _deleteApi.deleteAcount();

    if (data.statusCode == 200) {
      emit(LogoutSuccses());
    }
    emit(LogoutFieldError(field: 'error', message: 'delete fiald'));
  }
  void changeLanguage({required String lan}) {
    themeLanguag = lan;
    emit(ChangeLanguage(language: lan));
  }
}
