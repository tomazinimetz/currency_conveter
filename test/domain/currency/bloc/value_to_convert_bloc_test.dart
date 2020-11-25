import 'package:currency_converter/domain/currency_converter/bloc/value_to_convert_bloc.dart';
import 'package:currency_converter/domain/currency_converter/models/currency_converted.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {
  testWidgets('Should change current value', (WidgetTester tester) async {
    GetIt.I.registerFactory<ValueToConvertBloc>(() => ValueToConvertBloc());
    final bloc = GetIt.I.get<ValueToConvertBloc>();
    CurrencyConverted.currentRate = 0;
    String value = "10";
    bloc.changeCurrentRate(value.toString());

    expect(CurrencyConverted.currentRate, double.parse(value));
    GetIt.I.unregister<ValueToConvertBloc>();
  });
}
