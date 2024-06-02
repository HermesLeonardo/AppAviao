import 'package:flutter/material.dart';

class ItensLista extends StatelessWidget {
  final String nome;
  final String codigo;
  final VoidCallback onDelete;
  final VoidCallback onViewDetails;

  const ItensLista({
    super.key,
    required this.nome,
    required this.codigo,
    required this.onDelete,
    required this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(nome),
      subtitle: Text(codigo),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.visibility),
            onPressed: onViewDetails,
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}
