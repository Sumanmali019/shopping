import 'package:flutter/material.dart';

class CustomtextField extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  const CustomtextField(
      {super.key, required this.controller, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: text,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black38),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black38),
        ),
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return "Enter valid $text";
        }
        return null;
      },
    );
  }
}
