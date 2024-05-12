import 'package:flutter/material.dart';

class TrechoInfoWidget extends StatelessWidget {
  final String de;
  final String para;
  final String trecho;
  final String corredor;
  //final String altcorredor;
  //final String frequencia;
  //final String frequenciaalter;
  final String proa;
  //final String Dist184MN;
  final Function() onEdit;
  final Function() onDelete;

  const TrechoInfoWidget({
    super.key,
    required this.de,
    required this.para,
    required this.trecho,
    required this.corredor,
    //required this.altcorredor,
    //required this.frequencia,
    //required this.frequenciaalter,
    required this.proa,
    //required this.Dist184MN,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color.fromARGB(255, 236, 6, 6)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'De: $de     -     Para: $para',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Trecho: $trecho    -    Corredor: $corredor    -    Proa: $proa',
                  style: const TextStyle(fontSize: 14),
                )
              ],
            ),
            const SizedBox(height: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: onEdit,
                  icon: const Icon(Icons.edit),
                  label: const Text('Alterar'),
                ),
                const SizedBox(width: 6),
                ElevatedButton.icon(
                  onPressed: onDelete,
                  icon: const Icon(Icons.delete),
                  label: const Text('Excluir'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
