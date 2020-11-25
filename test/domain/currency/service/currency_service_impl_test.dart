import 'package:currency_converter/domain/currency_converter/models/currency.dart';
import 'package:currency_converter/domain/currency_converter/service/currency_service.dart';
import 'package:currency_converter/shared/services/hive_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockService extends Mock implements CurrencyService {}

class MockHive extends Mock implements HiveService {}

void main() {
  testWidgets('Should return the latest currency from API',
      (WidgetTester tester) async {
    var _service = MockService();
    final currency = Currency(base: "EUR", rates: {
      "BRL": 20,
      "CAD": 10,
    });

    when(await _service.getLatestCurrency()).thenAnswer((_) async => currency);

    expect(await _service.getLatestCurrency(), currency);
  });
}
