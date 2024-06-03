import 'package:appaviao/DTOS/controleVooDTO/controleVoo_dto.dart';
import 'package:appaviao/listagem_controlevoo/lista_controleVoo.dart';
import 'package:appaviao/listagem_controlevoo/tela_editar_controleVoo.dart';
import 'package:appaviao/pages/barra_navegacao.dart';
import 'package:appaviao/pages/tela_cadastro_controle_voo.dart';
import 'package:flutter/material.dart';
import 'package:appaviao/classes_dao/controleVoo_dao.dart';

class tela_lista_controlevoo extends StatefulWidget {
  const tela_lista_controlevoo({super.key});

  @override
  _tela_lista_controlevooState createState() => _tela_lista_controlevooState();
}

class _tela_lista_controlevooState extends State<tela_lista_controlevoo> {
  late Future<List<controleVoo_dto>> listacontroleVooDTO;

  @override
  void initState() {
    super.initState();
    listacontroleVooDTO = controleVoo_dao().selecionarControleVoo();
  }

  void _deleteControleVoo(int id) async {
    await controleVoo_dao().deleteControleVoo(id);
    setState(() {
      listacontroleVooDTO = controleVoo_dao().selecionarControleVoo();
    });
  }

  void _editControleVoo(controleVoo_dto controleVoo) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => EditarControleVoo(controleVoo: controleVoo)),
    ).then((_) {
      setState(() {
        listacontroleVooDTO = controleVoo_dao().selecionarControleVoo();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<controleVoo_dto>>(
        future: listacontroleVooDTO,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Sem Controle de Voo'));
          } else {
            List<Lista_controleVoo> listaItenscontroleVoo = [];
            for (var controleVoo in snapshot.data!) {
              listaItenscontroleVoo.add(Lista_controleVoo(
                nomeViagem: controleVoo.nomeViagem,
                dataViagem: controleVoo.dataViagem,
                onEdit: () => _editControleVoo(controleVoo),
                onDelete: () => _deleteControleVoo(controleVoo.idcontroleVoo!),
              ));
            }

            return ListView.builder(
              itemCount: listaItenscontroleVoo.length,
              itemBuilder: (BuildContext context, int index) {
                return listaItenscontroleVoo[index];
              },
            );
          }
        },
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text('Listagem Controle Voo'),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const tela_cadastro_controle_voo()),
          );
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const BarraNavegacao(currentIndex: 0),
    );
  }
}
