import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:crop_doctor/app.dart';
import 'package:crop_doctor/providers/app_provider.dart';
import 'package:crop_doctor/providers/nav_provider.dart';
import 'package:crop_doctor/providers/theme_provider.dart';
import 'package:crop_doctor/providers/user_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppProvider.initApp();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) {
      runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (BuildContext context) => AppProvider()),
            ChangeNotifierProvider(create: (BuildContext context) => NavProvider()),
            ChangeNotifierProvider(create: (BuildContext context) => ThemeProvider()),
            ChangeNotifierProvider(create: (BuildContext context) => UserProvider()),
          ],
          child: const CropDoctor(),
        ),
      );
    },
  );
}
