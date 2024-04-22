import 'package:flutter/material.dart';

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Card(
          color: Color.fromARGB(255, 32, 28, 169),
          child: ListTile(
            leading: Icon(Icons.music_note),
            title: Text("System Of Down"),
            subtitle: Text("cantam: B.O.B"),
          ),
        ),
        ListTile(
          key: Key('piroca'),
        )
      ],
    );
  }
}
