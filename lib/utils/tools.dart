import 'package:intl/intl.dart';

class Tools {
  static dynamic formatDate(date) {
    return DateFormat('yyyy MMM dd').format(date);
  }

  static dynamic rupiah(value, {type = 'ID'}) {
    if (type == 'ID') {
      // final currentFormater = NumberFormat.currency(locale: 'ID');
      final currencyFormatter = NumberFormat('#,###', 'ID');
      return currencyFormatter.format(value);
    }
  }
}
