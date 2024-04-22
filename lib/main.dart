import 'package:appaviao/pages/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const login(),
        appBar: AppBar(
            title: const Text("Teste tela"),
            backgroundColor: const Color.fromARGB(255, 20, 20, 204)),
      ),
    );
  }
}
