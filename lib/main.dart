import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/routeing/app_routing.dart';
import 'package:gradution/core/routeing/routes.dart';

/// The entry point of the application.
void main() {
  runApp(
    DevicePreview(
      enabled: false, // Disable device preview
      builder: (context) => 
      EZhome(
        appRouting: AppRouting(), // Initialize app routing
      ),
    ),
  );
}

class EZhome extends StatelessWidget {
  final AppRouting appRouting;
  const EZhome({super.key, required this.appRouting});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            theme: ThemeData(
              fontFamily: 'Poppins',
            ),
            title: 'EZhome',
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.onBoarding,
            onGenerateRoute: appRouting.generateRoute,
          );
        });
  }
}
