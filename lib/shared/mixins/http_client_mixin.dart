
import 'package:currency_converter/shared/providers/http_client.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

mixin HttpClientMixin {
  Dio getClient(){
    return GetIt.I.get<HttpClient>().client;
  }
}