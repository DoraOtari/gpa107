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
      appBar: AppBar(
        title: const Text('Keranjang'),
      ),
      body: Consumer<ProviderKeranjang>(
        builder: (context, provKeranjang, child) => Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: provKeranjang.jmlProduk,
                itemBuilder: (context, index) {
                  final Produk produk = provKeranjang.listProduk[index];
                  return Dismissible(
                    onDismissed: (_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text('Produk berhasil dihapus dari keranjang'),
                        ),
                      );
                      provKeranjang.hapusKeranjang(produk);
                    },
                    confirmDismiss: (_) => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Konfirmasi Hapus'),
                        content: const Text(
                            'Apakah Anda yakin ingin menghapus produk ini?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, false),
                            child: const Text('Batal'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, true),
                            child: const Text('Hapus'),
                          ),
                        ],
                      ),
                    ),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      alignment: Alignment.centerRight,
                      color: Colors.red,
                      child: const Icon(
                        Icons.delete,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                    key: UniqueKey(),
                    child: ListTile(
                      leading: AspectRatio(
                        aspectRatio: 1 / 1,
                        child: Image.network(produk.image),
                      ),
                      title: Text(produk.title),
                      subtitle: Text(formatRupiah(produk.price)),
                    ),
                  );
                },
              ),
            ),
            const Text('Total Bayar'),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Barang'),
                Text('${provKeranjang.jmlProduk}')
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Total Bayar'), Text('2000')],
            ),
          ],
        ),
      ),
    );
  }
}
