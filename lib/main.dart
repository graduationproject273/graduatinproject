import 'package:flutter/material.dart';
import 'package:gradution/core/routeing/app_routing.dart';
import 'package:gradution/core/routeing/routes.dart';

void main() {
  runApp(MyApp(
    appRouting: AppRouting(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouting appRouting;
  const MyApp({super.key, required this.appRouting});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.onBoarding,
      onGenerateRoute: appRouting.generateRoute,
    );
  }
}
