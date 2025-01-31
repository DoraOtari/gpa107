import 'package:flutter/material.dart';
import 'package:myapp/detail.dart';
import 'package:myapp/kategori.dart';
import 'package:myapp/produk.dart';
import 'package:myapp/rupiah.dart';

class TokoPage extends StatelessWidget {
  const TokoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getProduk(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<Produk> listProduk = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                  child: FutureBuilder(
                    future: getKategori(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<String> listKategori = snapshot.data!;
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: listKategori.length,
                          itemBuilder: (context, index) {
                            final String kategori = listKategori[index];
                            return Container(
                              margin: const EdgeInsets.only(right: 8,bottom: 8),
                              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                              decoration: BoxDecoration(
                                color: Colors.pink,
                                borderRadius: BorderRadius.circular(8)
                              ),
                              child: Text(kategori,style: const TextStyle(color: Colors.white),));
                          },
                        );
                      }
                      return const Center(
                        child: LinearProgressIndicator(),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              crossAxisCount: 2),
                      itemCount: listProduk.length,
                      itemBuilder: (context, index) {
                        final Produk produk = listProduk[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                          produk: produk,
                                        )));
                          },
                          child: Column(
                            children: [
                              Expanded(
                                child: AspectRatio(
                                  aspectRatio: 3 / 4,
                                  child: Image.network(
                                    produk.image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 4),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 2, vertical: 4),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.purple)),
                                child: Text(
                                  produk.category.toUpperCase(),
                                  style: const TextStyle(color: Colors.purple),
                                ),
                              ),
                              Text(
                                produk.title,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    formatRupiah(produk.price),
                                    style: const TextStyle(
                                        color: Colors.orange,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Wrap(
                                    children: [
                                      const Icon(Icons.person),
                                      Text('${produk.count}')
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Center(
            child: Text('Terjadi Kesalahan ${snapshot.error}'),
          );
        }
      },
    );
  }
}
