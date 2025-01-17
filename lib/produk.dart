import 'dart:convert';

import 'package:http/http.dart' as http;

class Produk {
  final int id;
  final String title;
  final String description;
  final num price;
  final String image;
  final int count;
  final num rate;
  final String category;

  Produk({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.count,
    required this.rate,
    required this.category,
  });

  factory Produk.fromJson(Map<String, dynamic> json) {
    return Produk(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        price: json['price'],
        image: json['image'],
        count: json['rating']['count'],
        rate: json['rating']['rate'],
        category: json['category']);
  }

  @override
  String toString() {
    return 'Data Produk: $title';
  }
}

Future<List<Produk>> getProduk() async {
  // ambek datanyo dari link api simpen di variabel
  final respon = await http.get(Uri.parse('https://fakestoreapi.com/products'));
  if (respon.statusCode == 200) {
    // keluarke isi data nyo dari bungkusnyo simpen ke variabel lagi
    final List<dynamic> data = jsonDecode(respon.body);
    // masuke factory biar di proses dari data mentah jadi data mateng
    final List<Produk> listProduk = data
        .map(
          (e) => Produk.fromJson(e),
        )
        .toList();
    return listProduk;
  } else {
    throw Exception('gagal ambil data di internet');
  }
}
