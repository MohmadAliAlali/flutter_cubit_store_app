import 'package:hive_flutter/hive_flutter.dart';
import 'boxes.dart';

class HiveManager {
  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(HiveBoxes.userBox); // يحتوي على التوكن
    await Hive.openBox(HiveBoxes.medicationBox);
    await Hive.openBox(HiveBoxes.reportsBox);
    await Hive.openBox(HiveBoxes.userSettingsBox);
  }

  static Box getBox(String boxName) => Hive.box(boxName);

  static Future<void> saveToken(String token) async {
    await getBox(HiveBoxes.userBox).put('token', token);
  }

  // ✅ استرجاع التوكن (يمكن أن يكون null)
  static String? getToken() {
    return getBox(HiveBoxes.userBox).get('token');
  }

  // ✅ حذف التوكن (عند تسجيل الخروج)
  static Future<void> deleteToken() async {
    await getBox(HiveBoxes.userBox).delete('token');
  }

  // ✅ هل يوجد توكن؟
  static bool hasToken() {
    return getBox(HiveBoxes.userBox).containsKey('token');
  }

  static Future<void> saveUser(String token) async {
    await getBox(HiveBoxes.userBox).put('user', token);
  }

  static String? getUser() {
    return getBox(HiveBoxes.userBox).get('user');
  }

  static Future<void> deleteUser() async {
    await getBox(HiveBoxes.userBox).delete('user');
  }

  static bool hasUser() {
    return getBox(HiveBoxes.userBox).containsKey('user');
  }
}