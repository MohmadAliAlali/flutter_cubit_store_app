part of 'settings_cubit.dart';

abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class ChangeMode extends SettingsState {
  final String mode;
  ChangeMode({required this.mode});
}

class ChangeLanguage extends SettingsState {
  final String language;
  ChangeLanguage({required this.language});
}