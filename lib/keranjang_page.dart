import 'package:flutter/material.dart';
import 'package:myapp/keranjang.dart';
import 'package:myapp/produk.dart';
import 'package:myapp/rupiah.dart';
import 'package:provider/provider.dart';

class KeranjangPage extends StatelessWidget {
  const KeranjangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProviderKeranjang>(
        builder: (context, provKeranjang, child) => ListView.builder(
          itemCount: provKeranjang.jmlProduk,
          itemBuilder: (context, index) {
            final Produk produk = provKeranjang.listProduk[index];
            return ListTile(
              leading: AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.network(produk.image),
              ),
              title: Text(produk.title),
              subtitle: Text(formatRupiah(produk.price)),
            );
          },
        ),
      ),
    );
  }
}
