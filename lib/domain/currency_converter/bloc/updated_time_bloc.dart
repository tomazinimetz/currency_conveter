import 'dart:async';
import 'package:currency_converter/domain/currency_converter/models/currency_converted.dart';
import 'package:currency_converter/shared/bloc/bloc.dart';

class UpdatedTimeBloc extends Bloc {
  final _controller = StreamController<DateTime>();

  Stream<DateTime> get stream => _controller.stream;

  String get getUpdateStatusText => CurrencyConverted.getUpdateStatusText;

  @override
  void dispose() {
    _controller.close();
  }

  void updateTime(DateTime dateTime) {
     CurrencyConverted.setUpdated(dateTime);
    _controller.sink.add(dateTime);
  }
}
