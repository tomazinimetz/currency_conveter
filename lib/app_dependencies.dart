import 'package:currency_converter/domain/currency_converter/bloc/currency_converted_bloc.dart';
import 'package:currency_converter/domain/currency_converter/bloc/dropdown_bloc.dart';
import 'package:currency_converter/domain/currency_converter/bloc/updated_time_bloc.dart';
import 'package:currency_converter/domain/currency_converter/bloc/value_to_convert_bloc.dart';
import 'package:currency_converter/domain/currency_converter/repository/currency_repository.dart';
import 'package:currency_converter/domain/currency_converter/repository/currency_repository_impl.dart';
import 'package:currency_converter/domain/currency_converter/service/currency_service.dart';
import 'package:currency_converter/domain/currency_converter/service/currency_service_impl.dart';
import 'package:currency_converter/shared/providers/http_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'shared/services/hive_service.dart';
import 'shared/services/hive_service_impl.dart';

class AppDependencies {
  static GetIt getIt = GetIt.I;

  static void registerDependencies() {
    getIt.registerLazySingleton<HiveService>(() => HiveServiceImpl());
    getIt.registerLazySingleton<CurrencyService>(() => CurrencyServiceImpl());
    getIt.registerLazySingleton<CurrencyRepository>(
        () => CurrencyRepositoryImpl());

    getIt.registerSingleton<HttpClient>(
      HttpClient(
        Dio(),
        DotEnv().env["API_URL"],
      ),
    );

    getIt.registerSingleton<CurrencyConvertedBloc>(CurrencyConvertedBloc());
    getIt.registerSingleton<DropdownBloc>(DropdownBloc());
    getIt.registerSingleton<ValueToConvertBloc>(ValueToConvertBloc());
    getIt.registerSingleton<UpdatedTimeBloc>(UpdatedTimeBloc());
  }
}
