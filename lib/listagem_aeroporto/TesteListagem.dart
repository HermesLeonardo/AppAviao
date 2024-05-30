import 'package:appaviao/DTOS/aeroportoDTO/aeroporto_dto.dart';
import 'package:appaviao/classes_dao/aeroporto_dao.dart';
import 'package:appaviao/listagem_aeroporto/itensLista.dart';
import 'package:appaviao/listagem_aeroporto/tela_editar_aeros.dart';
import 'package:appaviao/pages/tela_cadastro_aeroporto.dart';
import 'package:flutter/material.dart';

class TesteListagem extends StatefulWidget {
  const TesteListagem({super.key});

  @override
  _TesteListagemState createState() => _TesteListagemState();
}

class _TesteListagemState extends State<TesteListagem> {
  late Future<List<aeroporto_dto>> listaraeroDTO;

  @override
  void initState() {
    super.initState();
    listaraeroDTO = aeroporto_dao().selecionarAeroporto();
  }

  void _deleteAeroporto(int id) async {
    await aeroporto_dao().deleteAeroporto(id);
    setState(() {
      listaraeroDTO = aeroporto_dao().selecionarAeroporto();
    });
  }

  void _editAeroporto(aeroporto_dto aeroporto) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditarAeroportoScreen(aeroporto: aeroporto),
      ),
    ).then((_) {
      setState(() {
        listaraeroDTO = aeroporto_dao().selecionarAeroporto();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<aeroporto_dto>>(
        future: listaraeroDTO,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum aeroporto encontrado'));
          } else {
            List<ItensLista> listaItensLista = [];
            for (var aeroporto in snapshot.data!) {
              listaItensLista.add(ItensLista(
                nome: aeroporto.nome_aero,
                codigo: aeroporto.codigo_aero,
                onDelete: () => _deleteAeroporto(aeroporto.idaeroporto!),
                onEdit: () => _editAeroporto(aeroporto),
              ));
            }

            return ListView.builder(
              itemCount: listaItensLista.length,
              itemBuilder: (BuildContext context, int index) {
                return listaItensLista[index];
              },
            );
          }
        },
      ),
      appBar: AppBar(
        title: const Text("Listagem de Aeroportos"),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const tela_cadastro_aeroporto()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
