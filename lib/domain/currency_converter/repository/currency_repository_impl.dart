import 'package:currency_converter/domain/currency_converter/repository/currency_repository.dart';
import 'package:currency_converter/shared/mixins/http_client_mixin.dart';

class CurrencyRepositoryImpl
    with HttpClientMixin
    implements CurrencyRepository {
  @override
  Future getLatestCurrency() async => await getClient().get(
        'https://freecurrencyapi.net/api/v2/latest?apikey=fde7bc00-691a-11ec-a520-b59c9cccda49',
      );

  @override
  Future getCurrencyByBase(String shortening) async => await getClient().get(
        'https://freecurrencyapi.net/api/v2/latest?apikey=fde7bc00-691a-11ec-a520-b59c9cccda49&base_currency=$shortening',
      );
}
