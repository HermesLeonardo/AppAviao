import 'package:appaviao/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:appaviao/DTOS/usuarioDTO/usuario_dto.dart';
import 'package:appaviao/Custons/custom_tela_perfil/cutom_from_perfil.dart';
import 'package:appaviao/pages/perfil.dart';

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

  void cadastrar() {
    if (formKey.currentState!.validate()) {
      UsuarioDTO usuarioDTO = UsuarioDTO(
        nome: nomeController.text,
        telefone: telefoneController.text,
        email: emailController.text,
        senha: senhaController.text,
        modeloAeronave: modeloAeronaveController.text,
        codigoAeronave: codigoAeronaveController.text,
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Perfil(usuario: usuarioDTO),
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
      body: Stack(
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(200)),
            child: Container(
              height: size.height * 0.4,
              width: size.width,
              color: const Color.fromARGB(255, 0, 53, 84),
              child: Image.asset(
                'assets/images/aviaosfundo.png',
                fit: BoxFit.cover, // Ajusta a imagem para preencher o espaço
              ),
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
                  const Text(
                    "CADASTRO",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomfromPerfil(
                    labelText: "Nome completo",
                    controller: nomeController,
                  ),
                  const SizedBox(height: 15),
                  CustomfromPerfil(
                    labelText: "Email",
                    controller: emailController,
                  ),
                  const SizedBox(height: 15),
                  CustomfromPerfil(
                    labelText: "Telefone",
                    controller: telefoneController,
                  ),
                  const SizedBox(height: 15),
                  CustomfromPerfil(
                    labelText: "Senha",
                    controller: senhaController,
                    obscureText: true,
                  ),
                  const SizedBox(height: 15),
                  CustomfromPerfil(
                    labelText: "Modelo da Aeronave",
                    controller: modeloAeronaveController,
                  ),
                  const SizedBox(height: 15),
                  CustomfromPerfil(
                    labelText: "Código da Aeronave",
                    controller: codigoAeronaveController,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: cadastrar,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF003554),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Text('CADASTRAR'),
                  ),
                  const SizedBox(height: 15), // Espaço entre os botões
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginTela()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Text('Já tem uma conta? Login'),
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
