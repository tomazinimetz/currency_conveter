import 'package:hive/hive.dart';

part 'currency.g.dart';

@HiveType(typeId: 0)
class Currency extends HiveObject {
  Currency({this.base, this.rates, this.value, this.calculatedValue});

  @HiveField(0)
  String base;
  @HiveField(1)
  Map<String, dynamic> rates;
  @HiveField(2)
  double value;
  @HiveField(3)
  double calculatedValue;

  Currency.fromJson(Map<String, dynamic> json) {
    base = json['base'];
    rates = json['rates'];
    value = 1;
  }
}
