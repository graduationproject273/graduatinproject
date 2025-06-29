import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/databases/cache/cache_helper.dart';
import 'package:gradution/core/routeing/app_routing.dart';
import 'package:gradution/depency_injection.dart';


/// The entry point of the application.
void main() async {
  setup();
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(
    DevicePreview(
      enabled: false, // Disable device preview
      builder: (context) => EZhome(),
    ),
  );
}
class EZhome extends StatelessWidget {
  const EZhome({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          theme: ThemeData(
            fontFamily: 'Poppins',
          ),
          title: 'EZhome',
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        );
      },
    );
  }
}

