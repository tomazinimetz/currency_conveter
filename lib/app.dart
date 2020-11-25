import 'package:currency_converter/app_dependencies.dart';
import 'package:currency_converter/domain/splash/splash_route.dart';
import 'package:currency_converter/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  App() {
    AppDependencies.registerDependencies();
  }

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: Routes.all(),
        initialRoute: SplashRoute.name,
      );
}
