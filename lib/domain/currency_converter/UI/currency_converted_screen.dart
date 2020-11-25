import 'package:currency_converter/domain/currency_converter/bloc/currency_converted_bloc.dart';
import 'package:currency_converter/domain/currency_converter/models/currency_converted.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class CurrencyConvertedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamBuilder(
        stream: GetIt.I.get<CurrencyConvertedBloc>().stream,
        builder: (ctx, data) => GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: CurrencyConverted.all
              .map(
                (it) => Card(
                  color: getColorByRate(it.calculatedValue),
                  elevation: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          it.base,
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "\$ ${NumberFormat.currency(locale: 'eu', symbol: '').format(it.calculatedValue)}",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      );

  Color getColorByRate(value) {
    return value < CurrencyConverted.currentRate
        ? Colors.red
        : value == CurrencyConverted.currentRate
            ? Colors.orange
            : Colors.green;
  }
}
