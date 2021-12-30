import 'package:currency_converter/domain/currency_converter/models/currency.dart';
import 'package:currency_converter/utils/formatters/date_format.dart';

class CurrencyConverted extends Currency {
  static List<Currency> all = <Currency>[];

  static double currentRate = 1;
  static double currentValue = 1;
  static String currentBase = "USD";
  static DateTime lastUpdatedTime = DateTime.now();

  static bool isUpdated = false;

  static String get getUpdateStatusText => isUpdated
      ? "Dados atualizados " +
          DateFormatUtils.toBrazilianStringFormat(lastUpdatedTime)
      : "Dados não atualizados";

  static setUpdated(DateTime dateTime) {
    isUpdated = true;
    lastUpdatedTime = DateFormatUtils.toBrazilianDateTimeFormat(dateTime);
  }

  static setCurrentBase(String newBase) {
    currentBase = newBase;
  }

  static setCurrentRate(double newRate) {
    currentRate = newRate;
  }

  static void setAllCurrencies(Currency currency) {
    all.clear();
    currency.rates.forEach((key, value) {
      all.add(Currency(base: key, value: value, calculatedValue: value));
    });

    all.removeWhere((element) => element.base == currency.base);

    all.add(Currency(
      base: currency.base,
      value: currency.value,
      calculatedValue: currency.value,
    ));
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
    if (currentBase != currency.base) {
      setCurrentBase(currency.base);
    }
    setAllCurrencies(currency);
    sortList();
    setUpdated(DateTime.now());
  }
}
