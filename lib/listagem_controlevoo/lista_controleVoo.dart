import 'package:flutter/material.dart';

class Lista_controleVoo extends StatelessWidget {
  final String nomeViagem;
  final String dataViagem;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const Lista_controleVoo({
    super.key,
    required this.nomeViagem,
    required this.dataViagem,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: ListTile(
        title: Text('Nome: $nomeViagem'),
        subtitle: Text('Data: $dataViagem'),
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
                color: Color.fromARGB(255, 253, 1, 1),
              ),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
