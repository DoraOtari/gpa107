import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myapp/produk.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProviderKeranjang extends ChangeNotifier {
  List<Produk> _listProduk = [];

  List<Produk> get listProduk => _listProduk;
  int get jmlProduk => _listProduk.length;

  ProviderKeranjang() {
    loadKeranjang();
  }

  Future<void> loadKeranjang() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? listProdukString = prefs.getStringList('listProduk');
    if (listProdukString != null) {
      _listProduk = listProdukString
          .map((produkString) => Produk.fromJson(jsonDecode(produkString)))
          .toList();
      notifyListeners();
    }
  }

  void tambahKeranjang(Produk produk) {
    _listProduk.add(produk);
    notifyListeners();
  }
}
