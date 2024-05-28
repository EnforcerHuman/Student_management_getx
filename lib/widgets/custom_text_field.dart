import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController ageController;
  final String hint;
  final bool isnumber;
  final bool isobscure;
  const CustomTextField(
      {super.key,
      required this.ageController,
      required this.hint,
      required this.isnumber,
      this.isobscure = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: ageController,
      decoration:
          InputDecoration(hintText: hint, border: const OutlineInputBorder()),
      keyboardType: isnumber ? TextInputType.number : TextInputType.text,
      obscureText: isobscure,
    );
  }
}
