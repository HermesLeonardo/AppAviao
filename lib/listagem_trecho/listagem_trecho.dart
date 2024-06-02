import 'package:appaviao/DTOS/trechoDTO/trecho_dto.dart';
import 'package:appaviao/classes_dao/trecho_dao.dart';
import 'package:appaviao/listagem_trecho/itensListaTrecho.dart';
import 'package:appaviao/listagem_trecho/tela_editar_trecho.dart';
import 'package:appaviao/pages/tela_cadastro_trecho.dart';
import 'package:flutter/material.dart';

class listagem_trecho extends StatefulWidget {
  const listagem_trecho({super.key});

  @override
  _listagem_trechoState createState() => _listagem_trechoState();
}

class _listagem_trechoState extends State<listagem_trecho> {
  late Future<List<trecho_dto>> listartrechoDTO;

  @override
  void initState() {
    super.initState();
    listartrechoDTO = trecho_dao().selecionarTrecho();
  }

  void _deleteTrecho(int id) async {
    await trecho_dao().deleteTrecho(id);
    setState(() {
      listartrechoDTO = trecho_dao().selecionarTrecho();
    });
  }

  void _editTrecho(trecho_dto trecho) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditarTrechoScreen(trecho: trecho),
      ),
    ).then((_) {
      setState(() {
        listartrechoDTO = trecho_dao().selecionarTrecho();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<trecho_dto>>(
        future: listartrechoDTO,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum trecho encontrado'));
          } else {
            List<itensListaTrecho> listaItensListaTrecho = [];
            for (var trecho in snapshot.data!) {
              listaItensListaTrecho.add(itensListaTrecho(
                nome: trecho.trecho_trecho,
                de: trecho.de_trecho,
                para: trecho.para_trecho,
                onDelete: () => _deleteTrecho(trecho.idtrecho!),
                onEdit: () => _editTrecho(trecho),
              ));
            }

            return ListView.builder(
              itemCount: listaItensListaTrecho.length,
              itemBuilder: (BuildContext context, int index) {
                return listaItensListaTrecho[index];
              },
            );
          }
        },
      ),
      appBar: AppBar(
        title: const Text("Listagem de Trecho"),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const tela_cadastro_trecho()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
