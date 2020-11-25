import 'package:currency_converter/domain/currency_converter/bloc/currency_converted_bloc.dart';
import 'package:currency_converter/domain/currency_converter/bloc/value_to_convert_bloc.dart';
import 'package:currency_converter/domain/currency_converter/models/currency_converted.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

class ValueToConvertField extends StatelessWidget {
  const ValueToConvertField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => StreamBuilder(
        stream: GetIt.I.get<ValueToConvertBloc>().textFieldStream,
        builder: (ctx, data) => Expanded(
          child: Container(
            padding: EdgeInsets.all(20),
            child: TextFormField(
              inputFormatters: [LengthLimitingTextInputFormatter(10),],
                decoration: InputDecoration(
                  fillColor: Colors.red,
                  prefixIcon: Icon(Icons.monetization_on),
                  hintText: CurrencyConverted.currentRate.toString(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  GetIt.I.get<ValueToConvertBloc>().changeCurrentRate(value);
                  GetIt.I.get<CurrencyConvertedBloc>().convert(value);
                }),
          ),
        ),
      );
}
