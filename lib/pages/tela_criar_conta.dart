import 'package:appaviao/pages/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appaviao/Custons/custom_tela_cadastro/custom_form_cadastro.dart';

class tela_criar_conta extends StatelessWidget {
  const tela_criar_conta({super.key});

class Cadastro extends StatelessWidget {
  const Cadastro({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<
        FormState>(); // Movendo a declaração da variável para dentro do método build

    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Cadastro - Air Travel"),
        backgroundColor: const Color.fromARGB(255, 69, 159, 227),
      ),
      body: Stack(
        children: [
          ClipRRect(
            borderRadius:

                const BorderRadius.vertical(bottom: Radius.circular(200)),

                const BorderRadius.vertical(bottom: Radius.circular(400)),

            child: Container(
              height: size.height * 0.4,
              width: size.width * 1,
              color: const Color.fromARGB(255, 0, 53, 84),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(27),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  const SizedBox(
                    height: 450,
                  ), //espaço entre os campos
                  const Text(
                    "CADASTRO",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomFormCadastro(
                    labelText: "Nome Completo",
                    onSaved: (value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o seu nome completo';
                      }
                      return null;
                    },
                    icon: const Icon(Icons.person),
                  ),
                  const SizedBox(height: 10),
                  CustomFormCadastro(
                    labelText: "Telefone",
                    onSaved: (value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o seu telefone';
                      }
                      return null;
                    },
                    icon: const Icon(Icons.phone),
                  ),
                  const SizedBox(height: 10),
                  CustomFormCadastro(
                    labelText: "Senha",
                    onSaved: (value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a sua senha';
                      }
                      return null;
                    },
                    icon: const Icon(Icons.lock),
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                  CustomFormCadastro(
                    labelText: "Confirme sua senha",
                    onSaved: (value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, confirme sua senha';
                      }
                      return null;
                    },
                    icon: const Icon(Icons.lock),
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                  CustomFormCadastro(
                    labelText: "Modelo da Aeronave",
                    onSaved: (value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o modelo da aeronave';
                      }
                      return null;
                    },
                    icon: const Icon(Icons.airplanemode_active),
                  ),
                  const SizedBox(height: 10),
                  CustomFormCadastro(
                    labelText: "Código da Aeronave",
                    onSaved: (value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o código da aeronave';
                      }
                      return null;
                    },
                    icon: const Icon(Icons.confirmation_num),
                  ),
                  const SizedBox(height: 30),
                  CupertinoButton(
                    color: const Color.fromARGB(255, 69, 159, 227),
                    child: const Text("Cadastrar"),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
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
                        "Voltar para o Login",
                        style: TextStyle(
                            color: Color.fromARGB(255, 16, 33, 186),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => login()),
                        );
                      },
                    ),
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
