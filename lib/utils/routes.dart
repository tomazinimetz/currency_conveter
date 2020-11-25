import 'package:currency_converter/domain/currency_converter/UI/currency_conventer_route.dart';
import 'package:currency_converter/domain/splash/splash_route.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> all() =>
  {
    CurrencyConverterRoute.name: (_) => CurrencyConverterRoute(),
    SplashRoute.name: (_) => SplashRoute(),
  };
}