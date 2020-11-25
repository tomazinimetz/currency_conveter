import 'package:currency_converter/domain/currency_converter/bloc/dropdown_bloc.dart';
import 'package:currency_converter/domain/currency_converter/models/currency_converted.dart';
import 'package:currency_converter/domain/currency_converter/repository/currency_repository.dart';
import 'package:currency_converter/domain/currency_converter/repository/currency_repository_impl.dart';
import 'package:currency_converter/domain/currency_converter/service/currency_service.dart';
import 'package:currency_converter/domain/currency_converter/service/currency_service_impl.dart';
import 'package:currency_converter/shared/services/hive_service.dart';
import 'package:currency_converter/shared/services/hive_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {
  testWidgets('Should change current base', (WidgetTester tester) async {
    registerDependencies();

    final bloc = GetIt.I.get<DropdownBloc>();
    CurrencyConverted.currentBase = "EUR";
    String newBase = "BRL";

    bloc.changeCurrentBase(newBase);

    expect(CurrencyConverted.currentBase, newBase);
    unregisterDependencies();
  });

}

void unregisterDependencies() {
  GetIt.I.unregister<HiveService>();
  GetIt.I.unregister<DropdownBloc>();
  GetIt.I.unregister<CurrencyRepository>();
  GetIt.I.unregister<CurrencyService>();
}

void registerDependencies() {
  GetIt.I.registerLazySingleton<HiveService>(() => HiveServiceImpl());
  GetIt.I.registerLazySingleton<CurrencyRepository>(
      () => CurrencyRepositoryImpl());
  GetIt.I.registerLazySingleton<CurrencyService>(() => CurrencyServiceImpl());
  GetIt.I.registerFactory<DropdownBloc>(() => DropdownBloc());
}
