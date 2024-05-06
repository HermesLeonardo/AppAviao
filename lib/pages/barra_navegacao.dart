import 'package:flutter/material.dart';

class barra_navegacao extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;

  const barra_navegacao({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onItemTapped,
      //type: BottomNavigationBarType.fixed,

      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
      ],
    );
  }
}
