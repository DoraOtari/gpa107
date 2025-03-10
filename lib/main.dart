import 'package:flutter/material.dart';
import 'package:myapp/alamat.dart';
import 'package:myapp/galeri.dart';
import 'package:myapp/keranjang.dart';
import 'package:myapp/keranjang_page.dart';
import 'package:myapp/login.dart';
import 'package:myapp/register.dart';
import 'package:myapp/toko.dart';
import 'package:provider/provider.dart';

//fungsi utama untuk menjalankan kode
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProviderKeranjang(),
        ),
        ChangeNotifierProvider(
          create: (context) => AlamatProvider(),
        ),
      ],
      child: MaterialApp(routes: {
        '/keranjang': (context) => const KeranjangPage(),
        '/register': (context) => const RegisterPage(),
        '/login': (context) => const LoginPage(),
      }, debugShowCheckedModeBanner: false, home: const LoginPage())));
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/keranjang'),
            icon: Badge(
                label: Consumer<ProviderKeranjang>(
                    builder: (context, value, child) =>
                        Text('${value.jmlProduk}')),
                child: const Icon(Icons.shopping_bag)),
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
      body: [
        const HomePage(),
        const GaleriPage(),
        const TokoPage(),
      ][_halDipilih],
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
