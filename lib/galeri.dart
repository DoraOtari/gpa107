import 'package:flutter/material.dart';

class GaleriPage extends StatefulWidget {
  const GaleriPage({super.key});

  @override
  State<GaleriPage> createState() => _GaleriPageState();
}

class _GaleriPageState extends State<GaleriPage> {
  final List _listIsFavorit = List.generate(
    12,
    (_) => false,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GridView.builder(
        itemCount: 12,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 8, mainAxisSpacing: 8, crossAxisCount: 2),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: GridTile(
              footer: GridTileBar(
                backgroundColor: Colors.black.withOpacity(0.5),
                title: Text('Gambar ${index + 1}'),
                trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        _listIsFavorit[index] = !_listIsFavorit[index];
                      });
                    },
                    icon: Icon(
                      _listIsFavorit[index]
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.pink,
                    )),
              ),
              child: Image.network(
                'https://picsum.photos/id/${index * 2}/200',
                fit: BoxFit.fill,
              ),
            ),
          );
        },
      ),
    );
  }
}
