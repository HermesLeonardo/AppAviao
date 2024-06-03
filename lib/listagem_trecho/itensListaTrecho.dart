import 'package:flutter/material.dart';

class itensListaTrecho extends StatelessWidget {
  final String nome;
  final String de;
  final String para;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const itensListaTrecho({
    super.key,
    required this.nome,
    required this.de,
    required this.para,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: ListTile(
        title: Text("Nome: $nome"),
        subtitle: Text("De: $de" +"   " + "Para $para"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.remove_red_eye_rounded,
                  color: Color.fromARGB(255, 38, 84, 210)),
              onPressed: onEdit,
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
