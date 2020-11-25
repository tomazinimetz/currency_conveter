import 'package:currency_converter/domain/currency_converter/UI/currency_converted_screen.dart';
import 'package:currency_converter/domain/currency_converter/UI/dropdown_with_coins.dart';
import 'package:currency_converter/domain/currency_converter/UI/value_to_convert_field.dart';
import 'package:currency_converter/domain/currency_converter/service/currency_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CurrencyConverterRoute extends StatelessWidget {
  static const String name = "/currencyConverterRoute";

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Conversor de Moedas"),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Row(
                children: [
                  DropdownWithCoins(),
                  ValueToConvertField(),
                ],
              ),
              CurrencyConvertedScreen(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            try {
              await GetIt.I.get<CurrencyService>().getLatestCurrency();
            } catch (e) {}
          },
        ),
      );
}
