import 'package:currency_converter/domain/currency_converter/models/currency.dart';
import 'package:currency_converter/domain/currency_converter/models/currency_converted.dart';
import 'package:currency_converter/domain/currency_converter/repository/currency_repository.dart';
import 'package:currency_converter/domain/currency_converter/service/currency_service.dart';
import 'package:get_it/get_it.dart';

class CurrencyServiceImpl implements CurrencyService {
  final _repository = GetIt.I.get<CurrencyRepository>();

  @override
  Future getCurrencyByBase(String base) async {
    final result = await _repository.getCurrencyByBase(base);
    final currency = Currency.fromJson(result.data);
    CurrencyConverted.setCurrencyConverted(currency);
    return currency;
  }

  @override
  Future<Currency> getLatestCurrency() async {
    final result = await _repository.getLatestCurrency();
    final currency = Currency.fromJson(result.data);
    CurrencyConverted.setCurrencyConverted(currency);
    return currency;
  }
}
