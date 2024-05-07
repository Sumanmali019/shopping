import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTab;

  const CustomButton({super.key, required this.text, required this.onTab});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTab,
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50)),
      child: Text(text),
    );
  }
}
