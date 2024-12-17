import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:u_matter/utils/dependency_injection/initial_bindings.dart';
import 'package:u_matter/utils/routes/app_pages.dart';

import 'utils/constants/color_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    ///  using the following code i have made the app forced portrait so as not to allow rotation
    DeviceOrientation
        .portraitUp, /// but just to allow video player to rotate i have allowed forced rotation on it
  ]);

  await InitialBindings().onInit();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // A method to asynchronously fetch the locale based on the saved locale preference
  Future<Locale> fetchLocale() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? localeString = prefs.getString('locale');
    if (localeString != null) {
      final List<String> localeParts = localeString.split(',');
      debugPrint("printLocale: ${localeParts[0]}, ${localeParts[1]}");
      return Locale(localeParts[0], localeParts[1]);
    }
    // Default locale if preference is not set
    return const Locale('en', 'US');
  }

  @override
  Widget build(BuildContext context) {
    /// TODO: uncomment for handling incoming notification
    /// NotificationsUtils.handleClickNotification();
    return FutureBuilder<Locale>(
        future: fetchLocale(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator(
              color: appPrimaryColor,
            ));
          }
          return ScreenUtilInit(
              designSize: const Size(390, 844),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                return GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'GlamSpa & Salon App',
                  theme: ThemeData(
                    fontFamily: 'Montserrat',
                    brightness: Brightness.light,
                  ),
                  // translations: Languages(),
                  locale: snapshot.data,
                  fallbackLocale: const Locale("en", "US"),
                  // default language if no language is selected
                  initialRoute: AppPages.initial,
                  getPages: AppPages.routes,
                );
              });
        });
  }
}
