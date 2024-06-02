import 'package:flutter/material.dart';

class custom_from_text_field extends StatelessWidget {
  final String labelText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;

  const custom_from_text_field({
    super.key,
    required this.labelText,
    this.onSaved,
    this.validator,
    this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue, // Define a cor do contorno
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors
                .blue, // Define a cor do contorno quando o campo não está em foco
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors
                .blue, // Define a cor do contorno quando o campo está em foco
          ),
        ),
      ),
      validator: validator,
    );
  }
}
