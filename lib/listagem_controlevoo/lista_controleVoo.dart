import 'package:flutter/material.dart';

class Lista_controleVoo extends StatelessWidget {
  final String nomeViagem;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const Lista_controleVoo(
      {super.key,
      required this.nomeViagem,
      required this.onEdit,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 255, 255, 255)),
      ),
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: ListTile(
        title: Text(nomeViagem),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(
                Icons.remove_red_eye_rounded,
                color: Color.fromARGB(255, 38, 84, 210),
              ),
              onPressed: onEdit,
            ),
            IconButton(
              icon: const Icon(
                Icons.delete,
                color: Color.fromARGB(255, 38, 84, 210),
              ),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
