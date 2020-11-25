abstract class CurrencyRepository{
  Future getCurrencyByBase(String shortening);
  Future getLatestCurrency();
}