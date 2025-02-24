import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailCon = TextEditingController();
  final passwordCon = TextEditingController();
  Future<void> _register(email, password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacementNamed(context, '/login');
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Berhasil Registrasi')));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Gagal Registrasi $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
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
            child: FilledButton(
                onPressed: () => _register(emailCon.text, passwordCon.text),
                child: const Text('Submit')),
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
