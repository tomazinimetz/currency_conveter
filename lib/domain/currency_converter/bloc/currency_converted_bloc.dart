import 'dart:async';

import 'package:currency_converter/domain/currency_converter/models/currency_converted.dart';
import 'package:currency_converter/shared/bloc/bloc.dart';
import 'package:currency_converter/shared/services/hive_service.dart';
import 'package:get_it/get_it.dart';

class CurrencyConvertedBloc extends Bloc {
  final _controller = StreamController<String>();
  final _hive = GetIt.I<HiveService>();

  Stream<String> get stream => _controller.stream;

  void convert(String value) {
    CurrencyConverted.calculateValues();
    _controller.sink.add(value);
  }

  void setCurrencyConverted(String value) {
    final box = _hive.get(CurrencyConverted.currentBase);
    CurrencyConverted.setCurrencyConverted(
      box.get(CurrencyConverted.currentBase),
    );
    _controller.sink.add(value);
  }

  @override
  void dispose() {
    _controller.close();
  }
}
