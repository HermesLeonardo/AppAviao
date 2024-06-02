import 'package:flutter/material.dart';

class CustomFormCadastro extends StatelessWidget {
  final String labelText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final Widget? icon;
  final bool obscureText; // Adicionando a propriedade obscureText

  const CustomFormCadastro({
    super.key,
    required this.labelText,
    this.onSaved,
    this.validator,
    this.controller,
    this.icon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: icon,
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: Colors.lightBlue[50],
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 1.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onSaved: onSaved,
      validator: validator,
    );
  }
}
