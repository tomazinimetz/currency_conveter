import 'package:currency_converter/domain/currency_converter/bloc/currency_converted_bloc.dart';
import 'package:currency_converter/domain/currency_converter/models/currency_converted.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class CurrencyConvertedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamBuilder(
        stream: GetIt.I.get<CurrencyConvertedBloc>().stream,
        builder: (ctx, data) => Expanded(
          child: ListView(
            children: CurrencyConverted.all
                .map(
                  (it) => it.base == CurrencyConverted.currentBase
                      ? Container()
                      : Container(
                          height: 30,
                          decoration: BoxDecoration(border: Border.all()),
                          child: Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 2,
                                height: 20,
                                child: Text(it.base),
                              ),
                              Container(
                                child: Text(
                                    "${NumberFormat.currency(locale: 'eu', symbol: '').format(it.calculatedValue)}"),
                              ),
                            ],
                          ),
                        ),
                )
                .toList(),
          ),
        ),
      );
}
