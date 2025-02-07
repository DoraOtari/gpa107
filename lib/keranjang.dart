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
    List<String> listProdukString = prefs.getStringList('listProduk') ?? [];
    _listProduk = listProdukString
        .map((produkString) => Produk.fromJson(jsonDecode(produkString)))
        .toList();
    notifyListeners();
  }

  Future<void> _simpanKeranjang() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> listProdukString = _listProduk
        .map(
          (produk) => jsonEncode(produk.toJson()),
        )
        .toList();
    await prefs.setStringList('listProduk', listProdukString);
  }

  void tambahKeranjang(Produk produk) {
    _listProduk.add(produk);
    _simpanKeranjang();
    notifyListeners();
  }

  void hapusKeranjang(Produk produk) {
    _listProduk.removeWhere(
      (element) => element.id == produk.id,
    );
    _simpanKeranjang();
    notifyListeners();
  }
}
