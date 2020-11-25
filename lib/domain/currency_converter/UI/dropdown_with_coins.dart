import 'package:currency_converter/domain/currency_converter/bloc/currency_converted_bloc.dart';
import 'package:currency_converter/domain/currency_converter/bloc/dropdown_bloc.dart';
import 'package:currency_converter/domain/currency_converter/models/currency_converted.dart';
import 'package:currency_converter/utils/src/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class DropdownWithCoins extends StatelessWidget {
  DropdownWithCoins({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) => StreamBuilder(
        stream: GetIt.I.get<DropdownBloc>().dropdownStream,
        builder: (ctx, data) => Card(
          color: CustomColors.buttonColor,
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(20),
            child: DropdownButton(
              icon: Icon(Icons.arrow_downward, color: Colors.white),
              underline: Container(),
              hint: Text(
                "${CurrencyConverted.currentBase}",
                style: TextStyle(fontSize: 35, color: Colors.white),
              ),
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
                await GetIt.I.get<DropdownBloc>().changeCurrency(base);
                GetIt.I.get<DropdownBloc>().changeCurrentBase(base);
                GetIt.I.get<CurrencyConvertedBloc>().setCurrencyConverted(base);
                GetIt.I.get<CurrencyConvertedBloc>().convert(base);
              },
            ),
          ),
        ),
      );
}
