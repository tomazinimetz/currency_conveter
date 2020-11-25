import 'package:currency_converter/domain/currency_converter/models/currency.dart';

class CurrencyConverted extends Currency {
  static List<Currency> all = List<Currency>();

  static double currentRate = 1;
  static String currentBase = "";

  static setCurrentBase(String newBase) {
    currentBase = newBase;
  }

  static setCurrentRate(double newRate) {
    currentRate = newRate;
  }

  static void setAllCurrencies(Currency currency) {
    all.clear();
    all.add(Currency(base: currentBase, value: currentRate));
    currency.rates.forEach((key, value) {
      all.add(Currency(base: key, value: value, calculatedValue: value));
    });
  }

  static void calculateValues() {
    all.forEach((it) {
      it.calculatedValue = it.value;
      it.calculatedValue *= currentRate;
    });
  }

  static void sortList() {
    Comparator<Currency> nameComparator = (a, b) => a.base.compareTo(b.base);
    all.sort(nameComparator);
  }

  static void setCurrencyConverted(Currency currency) {
    setCurrentBase(currency.base);
    setAllCurrencies(currency);
    sortList();
  }
}
