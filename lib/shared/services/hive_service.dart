import 'package:currency_converter/domain/currency_converter/models/currency.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

abstract class HiveService {
  static Future init() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Hive.registerAdapter(CurrencyAdapter());
  }

  Future saveData(String boxName, dynamic data);
  void deleteBoxes();
  Box get(String boxName);
}
