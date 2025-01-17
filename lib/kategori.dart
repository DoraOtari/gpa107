import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<String>> getKategori() async {
  final respon =
      await http.get(Uri.parse('https://fakestoreapi.com/products/categories'));
  if (respon.statusCode == 200) {
    final List<dynamic> listKategori = jsonDecode(respon.body);
    return List<String>.from(listKategori);
  } else {
    throw Exception('Gagal Ambil Data dari link');
  }
}
