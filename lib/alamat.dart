import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Alamat {
  final String namaPenerima;
  final String alamatPengiriman;

  Alamat({required this.namaPenerima, required this.alamatPengiriman});

  Map<String, dynamic> toJson() => {
        'namaPenerima': namaPenerima,
        'alamatPengiriman': alamatPengiriman,
      };

  factory Alamat.fromJson(Map<String, dynamic> json) => Alamat(
      namaPenerima: json['namaPenerima'],
      alamatPengiriman: json['alamatPengiriman']);
}

class AlamatProvider extends ChangeNotifier {
  Alamat? _alamat;

  Alamat? get alamat => _alamat;

  AlamatProvider() {
    ambilPenerima();
  }

  Future<void> simpanPenerima(Alamat alamat) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('penerima', jsonEncode(alamat.toJson()));
    _alamat = alamat;
    notifyListeners();
  }

  Future<void> ambilPenerima() async {
    final prefs = await SharedPreferences.getInstance();
    final penerimaJson = prefs.getString('penerima');
    if (penerimaJson != null) {
      _alamat = Alamat.fromJson(jsonDecode(penerimaJson));
      notifyListeners();
    }
  }
}
