import 'package:flutter/material.dart';

class CustomfromPerfil extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final Widget? icon;
  final bool obscureText;
  final bool readOnly;

  const CustomfromPerfil({
    super.key,
    required this.labelText,
    this.controller,
    this.icon,
    this.obscureText = false,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      readOnly: readOnly,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: icon,
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: const Color.fromARGB(255, 255, 255, 255),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 1.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        labelStyle: const TextStyle(color: Colors.black),
      ),
    );
  }
}
