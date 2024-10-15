import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppProvider with ChangeNotifier {
  late PackageInfo _packageInfo;

  String getAppName() {
    return _packageInfo.appName;
  }

  String getPackageName() {
    return _packageInfo.packageName;
  }

  String getAppVersion() {
    return _packageInfo.version;
  }

  String getAppBuildNumber() {
    return _packageInfo.buildNumber;
  }

  static void dismissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  Future<void> getPackageInfo() async {
    _packageInfo = await PackageInfo.fromPlatform();
  }

  static Future<void> initApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await addGoogleFontsLicenses();
    await GetStorage.init();
  }

  static Future<void> addGoogleFontsLicenses() async {
    LicenseRegistry.addLicense(() async* {
      final license = await rootBundle.loadString('google_fonts/OFL.txt');
      yield LicenseEntryWithLineBreaks(['google_fonts'], license);
    });
  }

  static void showToast(String message) {
    SchedulerBinding.instance.addPostFrameCallback((_) => ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(content: Text(message))));
  }

  static void exitApp() {
    SystemNavigator.pop();
  }
}
