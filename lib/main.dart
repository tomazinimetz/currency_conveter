import 'package:currency_converter/app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'shared/services/hive_service.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = FlutterError.dumpErrorToConsole;

  await HiveService.init();
  
  await DotEnv().load();

  debugPrint = (String message, {int wrapWidth}) => debugPrintSynchronously(
        "[${DateTime.now()}]: $message",
        wrapWidth: wrapWidth,
      );

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  runApp(App());
}
