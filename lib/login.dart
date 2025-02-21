import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailCon = TextEditingController();
  final passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: MediaQuery.of(context).size.height * 0.5,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          const Column(
            children: [
              Text(
                'Login Aplikasi',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text('Masuk untuk mulai menggunakan aplikasi'),
            ],
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
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/register'),
                child: const Text('Registrasi')),
          ),
        ]),
      ),
    );
  }
}
