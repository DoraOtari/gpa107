import 'package:flutter/material.dart';
import 'package:myapp/produk.dart';
import 'package:myapp/rupiah.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.produk});
  final Produk produk;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.shopping_bag))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              child: Image.network(
                produk.image,
                width: 200,
              ),
            ),
            Container(
              margin:const EdgeInsets.only(top: 8),
              padding:const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                color: Colors.pink,
                child: Text(
                  produk.category.toUpperCase(),
                  style: TextStyle(color: Colors.white),
                )),
            Text(produk.title),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(formatRupiah(produk.price)),
              Wrap(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Text('${produk.rate}'),
                ],
              )
            ]),
            Card(
              color: Colors.pink.shade100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(produk.description),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
        child: Container(
          color: Colors.brown,
          height: 40,
          child: Align(
            child: Wrap(
              children: [
                Icon(Icons.add, color: Colors.white,),
                Text('Tambah Keranjang',style: TextStyle(color: Colors.white),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
