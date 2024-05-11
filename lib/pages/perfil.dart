import 'package:appaviao/pages/tela_inicial.dart';
import 'package:flutter/material.dart';
import 'package:appaviao/Custons/custom_tela_perfil/cutom_from_perfil.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  PerfilState createState() => PerfilState();
}

class PerfilState extends State<Perfil> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController modeloAeronaveController = TextEditingController();
  TextEditingController codigoAeronaveController = TextEditingController();

  bool editandoNome = false;
  bool editandoEmail = false;
  bool editandoTelefone = false;
  bool editandoSenha = false;
  bool editandoModeloAeronave = false;
  bool editandoCodigoAeronave = false;

  List<Map<String, String>> aeronaves = [];

  void adicionarNovaAeronave() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Adicionar Nova Aeronave'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Modelo:'),
                CustomfromPerfil(
                  labelText: "Modelo",
                  controller: modeloAeronaveController,
                ),
                const SizedBox(height: 10),
                const Text('Código:'),
                CustomfromPerfil(
                  labelText: "Código",
                  controller: codigoAeronaveController,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  final String novoModelo = modeloAeronaveController.text;
                  final String novoCodigo = codigoAeronaveController.text;

                  aeronaves.add({
                    'modelo': novoModelo,
                    'codigo': novoCodigo,
                  });

                  modeloAeronaveController.clear();
                  codigoAeronaveController.clear();

                  Navigator.of(context).pop();
                });
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  void editarAeronave(int index) {
    final Map<String, String> aeronave = aeronaves[index];

    setState(() {
      modeloAeronaveController.text = aeronave['modelo']!;
      codigoAeronaveController.text = aeronave['codigo']!;
      editandoModeloAeronave = true;
      editandoCodigoAeronave = true;
      aeronaves.removeAt(index);
    });

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Editar Aeronave'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Modelo:'),
                CustomfromPerfil(
                  labelText: "Modelo",
                  controller: modeloAeronaveController,
                ),
                const SizedBox(height: 10),
                const Text('Código:'),
                CustomfromPerfil(
                  labelText: "Código",
                  controller: codigoAeronaveController,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  final String novoModelo = modeloAeronaveController.text;
                  final String novoCodigo = codigoAeronaveController.text;

                  aeronaves.add({
                    'modelo': novoModelo,
                    'codigo': novoCodigo,
                  });

                  modeloAeronaveController.clear();
                  codigoAeronaveController.clear();
                  editandoModeloAeronave = false;
                  editandoCodigoAeronave = false;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  void excluirAeronave(int index) {
    setState(() {
      aeronaves.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil"),
        backgroundColor: const Color.fromARGB(255, 69, 159, 227),
      ),
      body: Container(
        color: const Color.fromARGB(255, 69, 159, 227),
        child: Container(
          color: const Color.fromARGB(255, 0, 53, 84),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 25),
                Row(
                  children: [
                    Expanded(
                      child: CustomfromPerfil(
                        labelText: "Nome",
                        controller: nomeController,
                        readOnly: !editandoNome,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          editandoNome = !editandoNome;
                        });
                      },
                      icon: Icon(editandoNome ? Icons.check : Icons.edit),
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    Expanded(
                      child: CustomfromPerfil(
                        labelText: "Email",
                        controller: emailController,
                        readOnly: !editandoEmail,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          editandoEmail = !editandoEmail;
                        });
                      },
                      icon: Icon(editandoEmail ? Icons.check : Icons.edit),
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    Expanded(
                      child: CustomfromPerfil(
                        labelText: "Telefone",
                        controller: telefoneController,
                        readOnly: !editandoTelefone,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          editandoTelefone = !editandoTelefone;
                        });
                      },
                      icon: Icon(editandoTelefone ? Icons.check : Icons.edit),
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    Expanded(
                      child: CustomfromPerfil(
                        labelText: "Senha",
                        controller: senhaController,
                        obscureText: true,
                        readOnly: !editandoSenha,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          editandoSenha = !editandoSenha;
                        });
                      },
                      icon: Icon(editandoSenha ? Icons.check : Icons.edit),
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    Expanded(
                      child: CustomfromPerfil(
                        labelText: "Modelo Aeronave",
                        controller: modeloAeronaveController,
                        readOnly: !editandoModeloAeronave,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          editandoModeloAeronave = !editandoModeloAeronave;
                        });
                      },
                      icon: Icon(
                          editandoModeloAeronave ? Icons.check : Icons.edit),
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    Expanded(
                      child: CustomfromPerfil(
                        labelText: "Código Aeronave",
                        controller: codigoAeronaveController,
                        readOnly: !editandoCodigoAeronave,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          editandoCodigoAeronave = !editandoCodigoAeronave;
                        });
                      },
                      icon: Icon(
                          editandoCodigoAeronave ? Icons.check : Icons.edit),
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: adicionarNovaAeronave,
                  child: const Text("Adicionar Nova Aeronave"),
                ),
                const SizedBox(height: 25),
                Column(
                  children: List.generate(aeronaves.length, (index) {
                    return Card(
                      child: ListTile(
                        title: Text('Modelo: ${aeronaves[index]['modelo']}'),
                        subtitle: Text('Código: ${aeronaves[index]['codigo']}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () => editarAeronave(index),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => excluirAeronave(index),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Lógica para salvar as alterações
                        setState(() {
                          editandoNome = false;
                          editandoEmail = false;
                          editandoTelefone = false;
                          editandoSenha = false;
                          editandoModeloAeronave = false;
                          editandoCodigoAeronave = false;
                        });
                      },
                      child: const Text("Salvar"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const tela_inicial()));
                      },
                      child: const Text("Voltar"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
