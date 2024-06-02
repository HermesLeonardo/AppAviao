import 'package:appaviao/Custons/custom_tela_perfil/cutom_from_perfil.dart';
import 'package:flutter/material.dart';
import 'package:appaviao/pages/tela_inicial.dart';
import 'package:appaviao/conexao/conexao.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  late TextEditingController nomeController;
  late TextEditingController emailController;
  late TextEditingController telefoneController;
  late TextEditingController senhaController;
  late TextEditingController modeloAeronaveController;
  late TextEditingController codigoAeronaveController;

  bool editandoNome = false;
  bool editandoEmail = false;
  bool editandoTelefone = false;
  bool editandoSenha = false;
  bool editandoModeloAeronave = false;
  bool editandoCodigoAeronave = false;

  List<Map<String, String>> aeronaves = [];

  @override
  void initState() {
    super.initState();
    nomeController = TextEditingController();
    emailController = TextEditingController();
    telefoneController = TextEditingController();
    senhaController = TextEditingController();
    modeloAeronaveController = TextEditingController();
    codigoAeronaveController = TextEditingController();
    getUsuarioFromDB();
  }

  void getUsuarioFromDB() async {
    final usuario = await conexao.instance.getUsuario();
    if (usuario != null) {
      setState(() {
        nomeController.text = usuario.nome;
        emailController.text = usuario.email;
        telefoneController.text = usuario.telefone;
        senhaController.text = usuario.senha;
        modeloAeronaveController.text = usuario.modeloAeronave;
        codigoAeronaveController.text = usuario.codigoAeronave;
        aeronaves.add({
          'modelo': usuario.modeloAeronave,
          'codigo': usuario.codigoAeronave,
        });
      });
    } else {
      print('Usuário não encontrado no banco de dados');
    }
  }

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

    adicionarNovaAeronave();
  }

  void excluirAeronave(int index) {
    setState(() {
      aeronaves.removeAt(index);
    });
  }

  void salvarAlteracoes() async {
    final db = await conexao.instance.database;

    await db.update(
      'usuarios',
      {
        'nome': nomeController.text,
        'telefone': telefoneController.text,
        'email': emailController.text,
        'senha': senhaController.text,
        'modeloAeronave': modeloAeronaveController.text,
        'codigoAeronave': codigoAeronaveController.text,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(title: const Text("Perfil"), backgroundColor: Colors.blue),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
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
                      color: Colors.blue),
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
                      color: Colors.blue),
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
                      color: Colors.blue),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: CustomfromPerfil(
                      labelText: "Senha",
                      controller: senhaController,
                      obscureText: false,
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
                      color: Colors.blue),
                ],
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: adicionarNovaAeronave,
                child: const Text("Adicionar Nova Aeronave"),
              ),
              const SizedBox(height: 25),
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
                    onPressed: salvarAlteracoes,
                    child: const Text("Salvar Alterações"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const tela_inicial(),
                        ),
                      );
                    },
                    child: const Text("Voltar"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
