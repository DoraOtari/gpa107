import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final namaCon = TextEditingController();
  final emailCon = TextEditingController();
  final passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Column(children: [
        const Text(
          'Register Akun',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Text('Registrasi akun baru kamu'),
        TextField(
          controller: namaCon,
          decoration: const InputDecoration(
              border: OutlineInputBorder(), label: Text('Nama Lengkap')),
        ),
        TextField(
          controller: emailCon,
          decoration: const InputDecoration(
              border: OutlineInputBorder(), label: Text('Nama Lengkap')),
        ),
        TextField(
          controller: passwordCon,
          obscureText: true,
          decoration: const InputDecoration(
              border: OutlineInputBorder(), label: Text('Nama Lengkap')),
        ),
        ElevatedButton(onPressed: () {}, child: Text('Submit'))
      ]),
    );
  }
}
