import 'package:flutter/material.dart';
import 'package:myapp/alamat.dart';
import 'package:myapp/keranjang.dart';
import 'package:myapp/produk.dart';
import 'package:myapp/rupiah.dart';
import 'package:provider/provider.dart';

class KeranjangPage extends StatefulWidget {
  const KeranjangPage({super.key});

  @override
  State<KeranjangPage> createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  final namaPenerimaCon = TextEditingController();

  final alamatPengirimanCon = TextEditingController();
  final alamatProvider = AlamatProvider();

  @override
  void initState() {
    context.read<AlamatProvider>().ambilPenerima();
    super.initState();
  }

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
            Consumer<AlamatProvider>(
              builder: (context, value, child) {
                final alamat = value.alamat;
                if (alamat == null) return Container();
                if (alamatProvider.alamat != null) {
                  namaPenerimaCon.text = alamatProvider.alamat!.namaPenerima;
                  alamatPengirimanCon.text =
                      alamatProvider.alamat!.alamatPengiriman;
                }
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Alamat Pengiriman'.toUpperCase()),
                          const Divider(),
                          Text('Nama Penerima : ${alamat.namaPenerima}'),
                          Text(
                              'Alamat Pengiriman : ${alamat.alamatPengiriman}'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            const Text('Total Bayar'),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total Barang'),
                Text('${provKeranjang.jmlProduk}')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total Bayar'),
                Text(formatRupiah(provKeranjang.totalBayar))
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, foregroundColor: Colors.white),
              onPressed: () => showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.grey.shade200,
                showDragHandle: true,
                context: context,
                builder: (context) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: Column(
                    children: [
                      Text('Alamat Pengiriman'.toUpperCase()),
                      TextFormField(
                        controller: namaPenerimaCon,
                        decoration: const InputDecoration(
                            label: Text('Nama Penerima'),
                            border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: alamatPengirimanCon,
                        maxLines: 3,
                        decoration: const InputDecoration(
                            label: Text('Alamat Pengiriman'),
                            border: OutlineInputBorder(),
                            floatingLabelBehavior:
                                FloatingLabelBehavior.always),
                      ),
                      GestureDetector(
                        onTap: () {
                          Alamat alamat = Alamat(
                              namaPenerima: namaPenerimaCon.text,
                              alamatPengiriman: alamatPengirimanCon.text);
                          Provider.of<AlamatProvider>(context, listen: false)
                              .simpanPenerima(alamat);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Alamat berhasil disimpan'),
                            ),
                          );
                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 15),
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          color: Colors.blue,
                          child: const Text(
                            'Bayar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              child: const Text('Checkout'),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
