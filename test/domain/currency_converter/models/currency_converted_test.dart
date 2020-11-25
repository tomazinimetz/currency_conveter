import 'package:currency_converter/domain/currency_converter/models/currency.dart';
import 'package:currency_converter/domain/currency_converter/models/currency_converted.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Should set new value", (_) async {
    CurrencyConverted.currentRate = 10;
    CurrencyConverted.setCurrentRate(20);
    expect(CurrencyConverted.currentRate, 20);
  });

  testWidgets("Should set new base", (_) async {
    CurrencyConverted.currentBase = "EUR";
    CurrencyConverted.setCurrentBase("BRL");
    expect(CurrencyConverted.currentBase, "BRL");
  });

  testWidgets("Should alphabetich sort list", (_) async {
    CurrencyConverted.all = [
      Currency(base: "A"),
      Currency(base: "D"),
      Currency(base: "C"),
      Currency(base: "B")
    ];

    CurrencyConverted.sortList();

    final sortedList = [
      Currency(base: "A"),
      Currency(base: "B"),
      Currency(base: "C"),
      Currency(base: "D"),
    ];

    expect(CurrencyConverted.all, sortedList);
  });

  testWidgets("Should calculate values by current rate", (_) async {
    CurrencyConverted.currentRate = 10;
    CurrencyConverted.all = [
      Currency(value: 2, calculatedValue: 2),
      Currency(value: 2, calculatedValue: 2),
      Currency(value: 2, calculatedValue: 2)
    ];

    CurrencyConverted.calculateValues();

    final expected = [
      Currency(value: 2, calculatedValue: 20),
      Currency(value: 2, calculatedValue: 20),
      Currency(value: 2, calculatedValue: 20)
    ];

    expect(CurrencyConverted.all, expected);
  });
}
