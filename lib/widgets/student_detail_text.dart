import 'package:flutter/material.dart';

class StudentdetailText extends StatelessWidget {
  final String text;
  final String leading;
  const StudentdetailText(
      {super.key, required this.text, required this.leading});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("$leading: $text",
            style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ],
    );
  }
}
