import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:testai/theme/dark_theme.dart';
import 'package:testai/theme/light_theme.dart';

import 'core/app_export.dart';

Rx<ThemeMode> themeMode = ThemeMode.system.obs;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return Obx(
        () => GetMaterialApp(
          builder: kIsWeb
              ? (context, child) => ResponsiveWrapper.builder(
                    child,
                    // maxWidth: 1200,
                    // minWidth: 480,
                    defaultScale: true,
                    breakpoints: [
                      const ResponsiveBreakpoint.resize(480, name: MOBILE),
                      const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                      const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
                    ],
                    background: Container(
                      color: themeMode.value == ThemeMode.dark
                          ? const Color.fromARGB(255, 25, 26, 26)
                          : const Color(0xFFF5F5F5),
                    ),
                  )
              : null,
          debugShowCheckedModeBanner: false,
          darkTheme: dark,
          theme: light,
          themeMode: themeMode.value,
          locale: Get.deviceLocale, //for setting localization strings
          fallbackLocale: const Locale('en', 'US'),
          title: 'Real Assist AI',
          initialBinding: InitialBindings(),
          initialRoute: AppRoutes.chatScreen,
          getPages: AppRoutes.pages,
        ),
      );
    });
  }
}
