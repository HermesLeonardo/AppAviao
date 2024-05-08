import 'dart:html';
import 'package:appaviao/Custons/Custom_tela_login/custom_from_login.dart';
import 'package:appaviao/pages/tela_criar_conta.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appaviao/pages/tela_inicial.dart';

class login extends StatelessWidget {
  login({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("AIR TRAVEL"),
        backgroundColor: const Color.fromARGB(255, 69, 159, 227),
      ),
      body: Stack(
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(450)),
            child: Container(
              height: size.height * 0.5,
              width: size.width * 5,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 0, 48, 73),
                image: DecorationImage(
                  image: AssetImage('assets/images/aviao.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.5,
              width: size.height,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.vertical(top: Radius.circular(1)),
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(27),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  const SizedBox(
                    height: 260,
                  ), //espaço entre os campos
                  const Text(
                    "LOGIN.",
                    style: TextStyle(
                      fontFamily: "Times New Roman",
                      fontSize: 30,
                      color: Colors.blue,
                    ),
                  ),

                  const SizedBox(height: 30),
                  custom_from_login(
                    labelText: "Nome",
                    onSaved: (value) {
                      // handle save
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o seu e-mail';
                      }
                      return null;
                    },
                    icon: const Icon(Icons.email),
                  ),
                  const SizedBox(height: 10),
                  custom_from_login(
                    labelText: "Digite sua senha",
                    onSaved: (value) {
                      // handle save
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a sua senha';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  CupertinoButton(
                    color: const Color.fromARGB(255, 69, 159, 227),
                    child: const Text("Acessar"),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const tela_inicial()));
                      }
                    },
                  ),
                  const SizedBox(height: 7),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white70, width: 0.8),
                        borderRadius: BorderRadius.circular(7)),
                    child: CupertinoButton(
                      child: const Text(
                        "Crie sua conta",
                        style: TextStyle(
                            color: Color.fromARGB(255, 16, 33, 186),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),  
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Cadastro()),
                        );
                      },
                    ),
                  CupertinoButton(
                    color: const Color.fromARGB(255, 39, 86, 157),
                    child: const Text("Cadastrar Conta"),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const tela_inicial()));
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
