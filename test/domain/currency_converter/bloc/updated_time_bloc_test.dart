import 'package:currency_converter/domain/currency_converter/bloc/dropdown_bloc.dart';
import 'package:currency_converter/domain/currency_converter/bloc/updated_time_bloc.dart';
import 'package:currency_converter/domain/currency_converter/repository/currency_repository.dart';
import 'package:currency_converter/domain/currency_converter/repository/currency_repository_impl.dart';
import 'package:currency_converter/domain/currency_converter/service/currency_service.dart';
import 'package:currency_converter/domain/currency_converter/service/currency_service_impl.dart';
import 'package:currency_converter/shared/services/hive_service.dart';
import 'package:currency_converter/shared/services/hive_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

main() {

  
  testWidgets(
      "Should set updated currency converted", (WidgetTester tester) async {
          registerDependencies();

          
          GetIt.I.get<UpdatedTimeBloc>().updateTime(DateTime.now());

        
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
