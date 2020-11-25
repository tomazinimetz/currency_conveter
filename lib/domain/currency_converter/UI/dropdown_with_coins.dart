import 'package:currency_converter/domain/currency_converter/bloc/currency_converted_bloc.dart';
import 'package:currency_converter/domain/currency_converter/bloc/dropdown_bloc.dart';
import 'package:currency_converter/domain/currency_converter/models/currency_converted.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class DropdownWithCoins extends StatelessWidget {
  DropdownWithCoins({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) => StreamBuilder(
        stream: GetIt.I.get<DropdownBloc>().dropdownStream,
        builder: (ctx, data) => Container(
          width: 100,
          height: 50,
          child: DropdownButton(
            hint: Text("${CurrencyConverted.currentBase}"),
            items: CurrencyConverted.all
                .map(
                  (it) => DropdownMenuItem(
                    child: it.base != CurrencyConverted.currentBase
                        ? Text(it.base)
                        : Container(),
                    value: it.base,
                  ),
                )
                .toList(),
            onChanged: (base) async {
              GetIt.I.get<DropdownBloc>().changeCurrentBase(base);
              await GetIt.I.get<DropdownBloc>().changeCurrency(base);
              GetIt.I.get<CurrencyConvertedBloc>().setCurrencyConverted(base);
              GetIt.I.get<CurrencyConvertedBloc>().convert(base);
            },
          ),
        ),
      );
}
