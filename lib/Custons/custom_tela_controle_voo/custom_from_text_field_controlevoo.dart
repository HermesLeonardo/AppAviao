import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class custom_from_text_field_controle_voo extends StatelessWidget {
  final String labelText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;

  const custom_from_text_field_controle_voo({
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
      ),
      onSaved: onSaved,
      validator: validator,
      //inputFormatters: [DataViagemMask()],
    );
  }
}

class DataViagemMask extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (!RegExp(r'\d+').hasMatch(newValue.text)) {
      return oldValue;
    }

    var data = newValue.text;
    final characters = data.characters.toList();
    var format = '';
    for (var i = 0; i < characters.length; i++) {
      if (i < 2) {
        format += characters[i];
      } else if (i == 2) {
        format += '/';
        format += characters[i];
      } else if (i == 4) {
        format += '/';
        format += characters[i];
      }
    }

    return newValue.copyWith(
      text: format,
      selection: TextSelection.fromPosition(
        TextPosition(offset: format.length),
      ),
    );
  }
}
