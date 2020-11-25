import 'package:currency_converter/domain/currency_converter/UI/currency_conventer_route.dart';
import 'package:currency_converter/domain/currency_converter/bloc/currency_converted_bloc.dart';
import 'package:currency_converter/domain/currency_converter/models/currency_converted.dart';
import 'package:currency_converter/shared/services/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class SplashRoute extends StatelessWidget {
  SplashRoute({Key key}) : super(key: key) {
    Future.wait(
      [
        // All the Futures that will be executed while loading
        Future.microtask(init).timeout(const Duration(seconds: 15)),
        Future.delayed(const Duration(seconds: 3)),
      ],
    );
  }

  static const String name = '/splash';

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: Text('Splash Screen! Loading a bunch of useful data...'),
        ),
      );

  Future init() async {
    try {
      final box = GetIt.I.get<HiveService>().get(CurrencyConverted.currentBase);
      if (box == null) {
        await GetIt.I
            .get<CurrencyConvertedBloc>()
            .getLatestCurrency(CurrencyConverted.currentBase);
      } else {
        GetIt.I
            .get<CurrencyConvertedBloc>()
            .setCurrencyConverted(CurrencyConverted.currentBase);
      }

      Get.offNamed(CurrencyConverterRoute.name);
    } catch (e) {}
  }
}
