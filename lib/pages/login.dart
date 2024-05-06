import 'package:appaviao/pages/tela_criar_conta.dart';
import 'package:appaviao/Custons/Custom_tela_login/custom_from_login.dart';
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
                const BorderRadius.vertical(bottom: Radius.circular(200)),
            child: Container(
              height: size.height * 0.4,
              width: size.width * 1,
              color: const Color.fromARGB(255, 0, 53, 84),
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
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Text(
              "Digite suas Credenciais para o acesso.",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            const CupertinoTextField(
              cursorColor: Colors.pinkAccent,
              padding: EdgeInsets.all(15),
              placeholder: "Digite o seu e-mail",
              placeholderStyle: TextStyle(color: Colors.white70, fontSize: 14),
              style: TextStyle(color: Colors.white, fontSize: 14),
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  )),
            ),
            const SizedBox(height: 5),
            const CupertinoTextField(
              padding: EdgeInsets.all(15),
              cursorColor: Colors.pinkAccent,
              placeholder: "Digite sua senha",
              obscureText: true,
              placeholderStyle: TextStyle(color: Colors.white70, fontSize: 14),
              style: TextStyle(color: Colors.white, fontSize: 14),
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  )),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                padding: const EdgeInsets.all(17),
                color: const Color.fromARGB(255, 69, 159, 227),
                child: const Text(
                  "Acessar",
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                onPressed: () {},
              ),
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
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const criarconta()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
