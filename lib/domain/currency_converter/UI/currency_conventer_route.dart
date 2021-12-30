import 'package:currency_converter/components/custom_button.dart';
import 'package:currency_converter/domain/currency_converter/UI/currency_converted_screen.dart';
import 'package:currency_converter/domain/currency_converter/UI/dropdown_with_coins.dart';
import 'package:currency_converter/domain/currency_converter/UI/value_to_convert_field.dart';
import 'package:currency_converter/domain/currency_converter/bloc/currency_converted_bloc.dart';
import 'package:currency_converter/domain/currency_converter/bloc/dropdown_bloc.dart';
import 'package:currency_converter/domain/currency_converter/bloc/updated_time_bloc.dart';
import 'package:currency_converter/domain/currency_converter/models/currency_converted.dart';
import 'package:currency_converter/utils/src/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CurrencyConverterRoute extends StatelessWidget {
  static const String name = "/currencyConverterRoute";

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColors.primaryColor,
          title: StreamBuilder(
            stream: GetIt.I.get<UpdatedTimeBloc>().stream,
            builder: (ctx, data) => Center(
              child: Text(
                GetIt.I.get<UpdatedTimeBloc>().getUpdateStatusText,
              ),
            ),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    DropdownWithCoins(),
                    ValueToConvertField(),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: CurrencyConvertedScreen(),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          width: double.infinity,
          child: CustomButton(
            text: "Atualizar",
            onTap: () async {
              await GetIt.I
                  .get<CurrencyConvertedBloc>()
                  .getLatestCurrencyByBase(CurrencyConverted.currentBase);
              GetIt.I
                  .get<DropdownBloc>()
                  .changeCurrentBase(CurrencyConverted.currentBase);
              GetIt.I
                  .get<CurrencyConvertedBloc>()
                  .setCurrencyConverted(CurrencyConverted.currentBase);
              GetIt.I
                  .get<CurrencyConvertedBloc>()
                  .convert(CurrencyConverted.currentBase);

              GetIt.I.get<UpdatedTimeBloc>().updateTime(DateTime.now());
            },
          ),
        ),
      );
}
