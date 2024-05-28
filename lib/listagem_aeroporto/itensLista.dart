import 'package:flutter/material.dart';

class ItensLista extends StatelessWidget {
  final String nome;
  final String codigo;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const ItensLista({
    super.key,
    required this.nome,
    required this.codigo,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: ListTile(
        title: Text(nome),
        subtitle: Text(codigo),
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
