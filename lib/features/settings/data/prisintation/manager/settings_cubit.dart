// import 'package:flutter_bloc/flutter_bloc.dart';
// part 'settings_state.dart';

// class SettingsCubit extends Cubit<SettingsState> {
//   SettingsCubit() : super(SettingsInitial());

//   String mode = 'system';
//   String language = "en";

// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  ThemeMode themeMode = ThemeMode.light;
  String themeLanguag = "arabic";

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

  void changeLanguage({required String lan}) {
    themeLanguag = lan;
    emit(ChangeLanguage(language: lan));
  }
}
