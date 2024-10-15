import 'package:get_storage/get_storage.dart';

class LocalStorageService {
  static const String darkModeKey = 'dark_mode';

  static void setDarkModePreference(bool value) {
    GetStorage().write(darkModeKey, value);
  }

  static bool? getDarkModePreference() {
    return GetStorage().read<bool>(darkModeKey);
  }

  static void clearLocalStorage() {
    GetStorage().erase();
  }
}
