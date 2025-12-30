part of 'settings_cubit.dart';

abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class ChangeMode extends SettingsState {
  final String mode;
  ChangeMode({required this.mode});
}
class LogoutLoading extends SettingsState{}
class LogoutSuccses extends SettingsState{}

class DeleteLoading extends SettingsState{}
class DeleteSuccses extends SettingsState{}


class LogoutFieldError extends SettingsState {
  final String field;   // email /   first / last / password
  final String message;

  LogoutFieldError({
    required this.field,
    required this.message,
  });
}


class ChangeLanguage extends SettingsState {
  final String language;
  ChangeLanguage({required this.language});
}