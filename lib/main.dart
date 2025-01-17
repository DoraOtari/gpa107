import 'package:flutter/material.dart';
import 'package:myapp/galeri.dart';
import 'package:myapp/toko.dart';

//fungsi utama untuk menjalankan kode
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _halDipilih = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: NavigationBar(
            selectedIndex: _halDipilih,
            indicatorColor: Colors.brown.shade300,
            onDestinationSelected: (value) {
              setState(() {
                _halDipilih = value;
              });
            },
            destinations: const <Widget>[
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(
                  icon: Icon(Icons.picture_in_picture), label: 'Galeri'),
              NavigationDestination(icon: Icon(Icons.store), label: 'Toko'),
            ]),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_bag),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.logout_rounded),
            ),
          ],
          backgroundColor: Colors.brown,
          foregroundColor: Colors.white,
          title: const Text('Whatsapp'),
        ),
        body: [
          const HomePage(),
          const GaleriPage(),
          const TokoPage(),
        ][_halDipilih],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (context, index) => ListTile(
        leading: CircleAvatar(
          foregroundImage:
              NetworkImage('https://picsum.photos/id/${index * 2}/200'),
        ),
        title: const Text('Ayu'),
        subtitle: Text('Pinjam dulu ${index + 1}00'),
        trailing: const Text('12.00'),
      ),
    );
  }
}
