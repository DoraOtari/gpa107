import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final namaCon = TextEditingController();
  final emailCon = TextEditingController();
  final passwordCon = TextEditingController();

  Future<void> _registerAkun(context, email, password) async {
    late String pesan;
    try {
      await Firebase.initializeApp();
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailCon.text, password: passwordCon.text);
      Navigator.pushReplacementNamed(context, '/login');
      pesan = 'Berhasil Mendaftar akun baru!';
    } catch (e) {
      pesan = 'Gagal Mendaftar akun baru! ${e.toString()}';
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(pesan)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: MediaQuery.of(context).size.height * 0.7,
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
                onPressed: () =>
                    _registerAkun(context, emailCon.text, passwordCon.text),
                child: const Text('Submit')),
          ),
          SizedBox(
            width: double.infinity,
            child: FilledButton.tonal(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/login'),
                child: const Text('Login')),
          ),
        ]),
      ),
    );
  }
}
