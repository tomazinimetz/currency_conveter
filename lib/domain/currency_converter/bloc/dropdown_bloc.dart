import 'dart:async';
import 'package:currency_converter/domain/currency_converter/bloc/updated_time_bloc.dart';
import 'package:currency_converter/domain/currency_converter/models/currency_converted.dart';
import 'package:currency_converter/domain/currency_converter/service/currency_service.dart';
import 'package:currency_converter/shared/bloc/bloc.dart';
import 'package:currency_converter/shared/services/hive_service.dart';
import 'package:get_it/get_it.dart';

class DropdownBloc extends Bloc {
  final _controller = StreamController<String>();
  final _service = GetIt.I.get<CurrencyService>();
  final _hive = GetIt.I<HiveService>();

  Stream<String> get dropdownStream => _controller.stream;

  void changeCurrentBase(String base) {
    final box = _hive.get(base);
    if (box != null) {
      CurrencyConverted.setCurrentBase(base);
    }
    _controller.sink.add(base);
  }

  @override
  void dispose() {
    _controller.close();
  }

  Future changeCurrency(String base) async {
    final box = _hive.get(base);
    if (box == null) {
      try {
        final currency = await _service.getCurrencyByBase(base);
        await GetIt.I.get<HiveService>().saveData(currency.base, currency);
        GetIt.I.get<UpdatedTimeBloc>().updateTime(DateTime.now());
      } catch (e) {}
    }
    _controller.sink.add(base);
  }
}
