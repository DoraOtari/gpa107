import 'package:intl/intl.dart';

String formatRupiah(harga) {
  final formatRupiah = NumberFormat.currency(
      locale: 'id_ID', name: 'id', symbol: 'Rp. ', decimalDigits: 2);
  return formatRupiah.format(harga * 15000);
}
