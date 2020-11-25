import 'package:currency_converter/domain/currency_converter/repository/currency_repository.dart';
import 'package:currency_converter/shared/mixins/http_client_mixin.dart';

class CurrencyRepositoryImpl
    with HttpClientMixin
    implements CurrencyRepository {
  @override
  Future getLatestCurrency() async => await getClient().get(
        "https://api.ratesapi.io/api/latest",
      );

  @override
  Future getCurrencyByBase(String shortening) async => await getClient().get(
        'https://api.ratesapi.io/api/latest?base=$shortening',
      );
}
