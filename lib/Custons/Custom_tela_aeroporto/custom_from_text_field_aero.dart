import 'package:flutter/material.dart';

class custom_from_text_field_aero extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;

  const custom_from_text_field_aero({
    super.key,
    required this.labelText,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0), // Arredonda as bordas
          borderSide: const BorderSide(
            color: Colors.blue,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(
            color: Colors.blue,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(
            color: Colors.blue,
          ),
        ),
      ),
      validator: validator,
    );
  }
}
