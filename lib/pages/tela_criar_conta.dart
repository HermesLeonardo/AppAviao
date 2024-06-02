import 'package:flutter/material.dart';
import 'package:appaviao/DTOS/usuarioDTO/usuario_dto.dart';
import 'package:appaviao/Custons/custom_tela_perfil/cutom_from_perfil.dart';
import 'package:appaviao/pages/perfil.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});
class tela_criar_conta extends StatelessWidget {
  const tela_criar_conta({super.key}); // Corrigindo a declaração da chave

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

  void cadastrar() {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Envolve o conteúdo em um SingleChildScrollView
        child: Container(
          width: double.infinity,
          color: const Color(0xFF003554),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/aviaosfundo.png',
                width: 150,
                height: 150,
              ),
              const SizedBox(height: 20),
              const Text(
                'COMECE AQUI',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  children: [
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
              width: size.width * 1,
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
                  const SizedBox(
                    height: 450,
                  ), //espaço entre os campos
                  const Text(
                    "CADASTRO",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
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
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginTela()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
