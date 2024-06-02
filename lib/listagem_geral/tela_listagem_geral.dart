import 'package:appaviao/pages/barra_navegacao.dart';
import 'package:flutter/material.dart';
import 'package:appaviao/DTOS/aeroportoDTO/aeroporto_dto.dart';
import 'package:appaviao/DTOS/controleVooDTO/controleVoo_dto.dart';
import 'package:appaviao/DTOS/trechoDTO/trecho_dto.dart';
import 'package:appaviao/classes_dao/aeroporto_dao.dart';
import 'package:appaviao/classes_dao/controleVoo_dao.dart';
import 'package:appaviao/classes_dao/trecho_dao.dart';

class TelaListagemGeral extends StatefulWidget {
  const TelaListagemGeral({super.key});

  @override
  _TelaListagemGeralState createState() => _TelaListagemGeralState();
}

class _TelaListagemGeralState extends State<TelaListagemGeral> {
  late Future<List<aeroporto_dto>> listarAeroportos;
  late Future<List<controleVoo_dto>> listarControleVoos;
  late Future<List<trecho_dto>> listarTrechos;

  @override
  void initState() {
    super.initState();
    listarAeroportos = aeroporto_dao().selecionarAeroporto();
    listarControleVoos = controleVoo_dao().selecionarControleVoo();
    listarTrechos = trecho_dao().selecionarTrecho();
  }

  void _viewItem(dynamic item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Detalhes do Item'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (item is aeroporto_dto)
                  Text(
                      'Nome: ${item.nome_aero}\nCódigo: ${item.codigo_aero}\nTWR: ${item.twr_aero}\nSolo: ${item.solo_aero}\nCabeceira: ${item.cabeceira_aero}\nFIR: ${item.fir_aero}\nMetragem Pista: ${item.metragem_pista}\nPatio ${item.patio_aero}'),
                if (item is trecho_dto)
                  Text(
                      'Nome: ${item.trecho_trecho}\nDe: ${item.de_trecho}\nPara: ${item.para_trecho}\nProa: ${item.proa_trecho}\nDist: ${item.dist_trecho}\nCorredor: ${item.corredor_trecho}\nAltura Corredor ${item.altCorredor_trecho}\nFrequencia ${item.frequencia_trecho}\nFrequencia Alter ${item.frequenciaAlter_trecho} '),
                if (item is controleVoo_dto)
                  Text(
                      'Data Viagem: ${item.dataViagem}\nNome da Viagem: ${item.nomeViagem}\nControle: ${item.controle}\nLat: ${item.lat}\nLat: ${item.lat}\nLong: ${item.lag}\nQMH Local: ${item.qmh_local}\nQMH Destino: ${item.qmh_destino}\nRadio: ${item.radio}\nTransponder 1: ${item.transponder_1}\nTransponder Emergência: ${item.transponder_emergencia}\nElevação Local: ${item.elevacao_local}\nElevação Destino: ${item.elevacao_destino}\nAltitude Obrigatório: ${item.altitude_obrigatorio}\nTempo Voo Estimado: ${item.tempo_voo_estimado}\nAlternativo 1: ${item.alternativo_1}\nAlternativo 2: ${item.alternativo_2}'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listagem Geral"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Quadro para Controle de Voo
            _buildQuadro(
              "Controle de Voo",
              _buildListaControleVoo(),
            ),

            // Quadro para Trechos
            _buildQuadro(
              "Trechos",
              _buildListaTrechos(),
            ),

            // Quadro para Aeroportos
            _buildQuadro(
              "Aeroportos",
              _buildListaAeroportos(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BarraNavegacao(currentIndex: 0),
    );
  }

  Widget _buildQuadro(String titulo, Widget listaItens) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          const SizedBox(height: 10),
          listaItens,
        ],
      ),
    );
  }

  Widget _buildListaAeroportos() {
    return FutureBuilder<List<aeroporto_dto>>(
      future: listarAeroportos,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('Nenhum aeroporto encontrado'));
        } else {
          return Column(
            children: snapshot.data!.map((aeroporto) {
              return ListTile(
                title: Text(aeroporto.nome_aero),
                onTap: () => _viewItem(aeroporto),
              );
            }).toList(),
          );
        }
      },
    );
  }

  Widget _buildListaTrechos() {
    return FutureBuilder<List<trecho_dto>>(
      future: listarTrechos,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('Nenhum trecho encontrado'));
        } else {
          return Column(
            children: snapshot.data!.map((trecho) {
              return ListTile(
                title: Text(trecho.trecho_trecho),
                onTap: () => _viewItem(trecho),
              );
            }).toList(),
          );
        }
      },
    );
  }

  Widget _buildListaControleVoo() {
    return FutureBuilder<List<controleVoo_dto>>(
      future: listarControleVoos,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('Nenhum controle de voo encontrado'));
        } else {
          return Column(
            children: snapshot.data!.map((controleVoo) {
              return ListTile(
                title: Text(controleVoo.nomeViagem),
                onTap: () => _viewItem(controleVoo),
              );
            }).toList(),
          );
        }
      },
    );
  }
}
