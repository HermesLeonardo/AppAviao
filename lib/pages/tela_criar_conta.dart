import 'package:appaviao/Custons/custom_tela_cadastro/custom_form_cadastro.dart';
import 'package:appaviao/pages/login.dart';
import 'package:flutter/material.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController modeloAeronaveController = TextEditingController();
  TextEditingController codigoAeronaveController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? validateNome(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira seu nome completo';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira seu email';
    }
    final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegExp.hasMatch(value)) {
      return 'Por favor, insira um email válido';
    }
    return null;
  }

  String? validateTelefone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira seu telefone';
    }
    return null;
  }

  String? validateSenha(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira uma senha';
    }
    if (value.length < 6) {
      return 'A senha deve ter pelo menos 6 caracteres';
    }
    return null;
  }

  String? validateModeloAeronave(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira o modelo da aeronave';
    }
    return null;
  }

  String? validateCodigoAeronave(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira o código da aeronave';
    }
    return null;
  }

  void cadastrar() async {
    if (formKey.currentState!.validate()) {
      // Simulação de salvamento de dados
      await Future.delayed(const Duration(seconds: 1));

      // Após salvar os dados, navegue para a tela de login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginTela(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Cadastro"),
        backgroundColor: const Color.fromARGB(255, 69, 159, 227),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ClipPath(
              clipper: BottomRoundedClipper(),
              child: Container(
                height: size.height * 0.4,
                width: size.width,
                color: const Color.fromARGB(255, 0, 53, 84),
                child: Image.asset(
                  'assets/images/aviaosfundo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.35,
                  left: 27,
                  right: 27,
                  bottom: 20,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        "CADASTRO",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      CustomFormCadastro(
                        labelText: "Nome completo",
                        controller: nomeController,
                        validator: validateNome,
                      ),
                      const SizedBox(height: 15),
                      CustomFormCadastro(
                        labelText: "Email",
                        controller: emailController,
                        validator: validateEmail,
                      ),
                      const SizedBox(height: 15),
                      CustomFormCadastro(
                        labelText: "Telefone",
                        controller: telefoneController,
                        validator: validateTelefone,
                      ),
                      const SizedBox(height: 15),
                      CustomFormCadastro(
                        labelText: "Senha",
                        controller: senhaController,
                        obscureText: true,
                        validator: validateSenha,
                      ),
                      const SizedBox(height: 15),
                      CustomFormCadastro(
                        labelText: "Modelo da Aeronave",
                        controller: modeloAeronaveController,
                        validator: validateModeloAeronave,
                      ),
                      const SizedBox(height: 15),
                      CustomFormCadastro(
                        labelText: "Código da Aeronave",
                        controller: codigoAeronaveController,
                        validator: validateCodigoAeronave,
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          onPressed: cadastrar,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFF003554),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          child: const Text('CADASTRAR'),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginTela(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 255, 255, 255),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          child: const Text('Já tem uma conta? Login',
                              style: TextStyle(color: Colors.blue)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomRoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
      size.width / 2,
      size.height + 70,
      size.width,
      size.height - 80,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
