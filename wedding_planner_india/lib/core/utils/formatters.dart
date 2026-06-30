import 'package:intl/intl.dart';

class CurrencyFormatter {
  CurrencyFormatter._();

  static String format(double amount, {String currency = 'INR'}) {
    final symbol = _symbolFor(currency);
    final formatter = NumberFormat.currency(
      symbol: symbol,
      decimalDigits: 0,
      locale: currency == 'INR' ? 'en_IN' : 'en_US',
    );
    return formatter.format(amount);
  }

  static String _symbolFor(String currency) {
    switch (currency) {
      case 'INR':
        return '₹';
      case 'USD':
        return '\$';
      case 'EUR':
        return '€';
      case 'GBP':
        return '£';
      case 'AED':
        return 'AED ';
      default:
        return '$currency ';
    }
  }
}

class AppDateUtils {
  AppDateUtils._();

  static String formatDate(DateTime date) {
    return DateFormat('dd MMM yyyy').format(date);
  }

  static String formatDateTime(DateTime date) {
    return DateFormat('dd MMM yyyy, hh:mm a').format(date);
  }
}
