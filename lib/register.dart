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
        title: const Text('Register'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: MediaQuery.of(context).size.height * 0.6,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          const Column(
            children: [
              Text(
                'Register Akun',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text('Registrasi akun baru kamu'),
            ],
          ),
          TextField(
            controller: namaCon,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), label: Text('Nama Lengkap')),
          ),
          TextField(
            controller: emailCon,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), label: Text('Email')),
          ),
          TextField(
            controller: passwordCon,
            obscureText: true,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), label: Text('Password')),
          ),
          SizedBox(
            width: double.infinity,
            child: FilledButton(onPressed: () {}, child: const Text('Submit')),
          ),
          SizedBox(
            width: double.infinity,
            child: FilledButton.tonal(
                onPressed: () {}, child: const Text('Login')),
          ),
        ]),
      ),
    );
  }
}
