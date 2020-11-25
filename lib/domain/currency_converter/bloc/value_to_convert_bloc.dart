import 'dart:async';

import 'package:currency_converter/domain/currency_converter/models/currency_converted.dart';
import 'package:currency_converter/shared/bloc/bloc.dart';

class ValueToConvertBloc extends Bloc {
  final _controller = StreamController<String>();

  Stream<String> get textFieldStream => _controller.stream;

  @override
  void dispose() {
    _controller.close();
  }

  void changeCurrentRate(String newValue) {
    CurrencyConverted.setCurrentRate(double.parse(newValue));
    _controller.sink.add(newValue);
  }
}
