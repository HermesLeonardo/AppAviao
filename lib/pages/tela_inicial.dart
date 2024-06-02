import 'package:appaviao/DTOS/usuarioDTO/usuario_dto.dart';
import 'package:appaviao/classes_dao/usuario_dao.dart';
import 'package:appaviao/entitites/usuario_entity.dart';
import 'package:appaviao/pages/login.dart';
import 'package:appaviao/pages/perfil.dart';
import 'package:appaviao/pages/tela_cadastro_aeroporto.dart';
import 'package:appaviao/listagem_geral/tela_listagem_geral.dart';
import 'package:appaviao/pages/tela_cadastro_controle_voo.dart';
import 'package:flutter/material.dart';
import 'tela_cadastro_trecho.dart';
import 'barra_navegacao.dart';

class tela_inicial extends StatelessWidget {
  const tela_inicial({super.key});

  Future<UsuarioDTO?> getUsuario() async {
    UsuarioDAO usuarioDAO = UsuarioDAO();
    List<Usuario> usuarios = await usuarioDAO.listarUsuarios();
    if (usuarios.isNotEmpty) {
      Usuario usuario = usuarios.first;
      return UsuarioDTO(
        nome: usuario.nome,
        telefone: usuario.telefone,
        email: usuario.email,
        senha: usuario.senha,
        modeloAeronave: usuario.modeloAeronave,
        codigoAeronave: usuario.codigoAeronave,
      );
    } else {
      return null;
    }
  }

  void showNoUserDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Nenhum usuário encontrado"),
          content: const Text("Por favor, cadastre um usuário primeiro."),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("AIR TRAVEL"),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: const Color.fromARGB(255, 0, 48, 73), // Cor azul
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: size.height * 0.3,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Image.asset(
                  'assets/images/aviaocriartela.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.35,
            left: 0,
            right: 0,
            child: const Center(
              child: Text(
                "Olá Piloto Fulano",
                style: TextStyle(
                  fontSize: 40,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.62,
              width: size.width,
              padding: const EdgeInsets.only(top: 30.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 100),
                    SizedBox(
                      height: 60,
                      width: 900,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        onPressed: () async {
                          UsuarioDTO? usuario = await getUsuario();
                          if (usuario != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Perfil(
                                  usuario: usuario,
                                ),
                              ),
                            );
                          } else {
                            showNoUserDialog(context);
                          }
                        },
                        child: const Text(
                          'Alterar Informações do Cadastro',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 60,
                      width: 900,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) =>
                                  const tela_cadastro_trecho()),
                            ),
                          );
                        },
                        child: const Text(
                          'Cadastrar Trecho',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 60,
                      width: 900,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) =>
                                  const tela_cadastro_aeroporto()),
                            ),
                          );
                        },
                        child: const Text(
                          'Cadastrar Aeroporto',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 60,
                      width: 900,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    const tela_cadastro_controle_voo())),
                          );
                        },
                        child: const Text(
                          'Cadastrar controle de voo',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 60,
                      width: 900,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    const TelaListagemGeral())),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        child: const Text(
                          'Iniciar Viagem',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 53, 80, 255),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 60,
                      width: 900,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const LoginTela())),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        child: const Text(
                          'Sair',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 100,
          ),
        ],
      ),
      bottomNavigationBar: const BarraNavegacao(currentIndex: 0),
    );
  }
}
