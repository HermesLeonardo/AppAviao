import 'package:appaviao/pages/tela_criar_conta.dart';
import 'package:flutter/material.dart';
import 'package:appaviao/listagem_trecho/listagem_trecho.dart';
import 'package:appaviao/listagem_aeroporto/TesteListagem.dart';
import 'package:appaviao/listagem_controlevoo/tela_lista_controlevoo.dart';
import 'package:appaviao/pages/tela_inicial.dart';

class BarraNavegacao extends StatelessWidget {
  final int currentIndex;

  const BarraNavegacao({
    super.key,
    required this.currentIndex,
  });

  void _onItemTapped(BuildContext context, int index) {
    if (index != currentIndex) {
      switch (index) {
        case 0:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const tela_inicial()),
          );
          break;
        case 1:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const TesteListagem()),
          );
          break;
        case 2:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const tela_lista_controlevoo()),
          );
          break;
        case 3: // Novo caso para navegar para a nova tela
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const TelaCadastro()),
          );
          break;
        default:
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    void onItemTapped(int index) {
      // Navegar para telas diferentes apenas se o índice for diferente de 0
      if (index != 0) {
        switch (index) {
          case 1:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const TesteListagem()),
            );
            break;
          case 2:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const listagem_trecho()),
            );
            break;
          case 3:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const tela_lista_controlevoo()),
            );
            break;
        }
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const tela_inicial()),
        );
      }
    }

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onItemTapped,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Início"),
        BottomNavigationBarItem(
            icon: Icon(Icons.flight_takeoff), label: "Aeroportos"),
        BottomNavigationBarItem(
            icon: Icon(Icons.airport_shuttle), label: "Trecho"),
        BottomNavigationBarItem(
            icon: Icon(Icons.control_camera), label: "Controle"),
      ],
      selectedItemColor: Colors.blue, // Ajuste de cor para o item selecionado
      unselectedItemColor: const Color.fromARGB(
          255, 13, 1, 129), // Ajuste de cor para os itens não selecionados
    );
  }
}
