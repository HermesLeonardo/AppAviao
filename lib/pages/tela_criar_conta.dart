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

  void cadastrar() async {
    if (formKey.currentState!.validate()) {
      try {
        final db = await conexao.instance.database;
        await db.insert('usuarios', usuarioDTO.toMap());
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Perfil(),
          ),
        );
      } catch (e) {
        print("Erro ao cadastrar usuário: $e");
      }
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
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(200)),
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
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(27),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 50),
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
                    ),
                    const SizedBox(height: 15),
                    CustomFormCadastro(
                      labelText: "Email",
                      controller: emailController,
                    ),
                    const SizedBox(height: 15),
                    CustomFormCadastro(
                      labelText: "Telefone",
                      controller: telefoneController,
                    ),
                    const SizedBox(height: 15),
                    CustomFormCadastro(
                      labelText: "Senha",
                      controller: senhaController,
                      obscureText: true,
                    ),
                    const SizedBox(height: 15),
                    CustomFormCadastro(
                      labelText: "Modelo da Aeronave",
                      controller: modeloAeronaveController,
                    ),
                    const SizedBox(height: 15),
                    CustomFormCadastro(
                      labelText: "Código da Aeronave",
                      controller: codigoAeronaveController,
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
    );
  }
}
