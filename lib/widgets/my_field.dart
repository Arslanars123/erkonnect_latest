import 'package:flutter/material.dart';


class MyField extends StatelessWidget {
  TextEditingController controller;
  String hint;
  MyField({super.key,required this.hint,required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xffF8F8F8))
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xffF8F8F8))
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xffF8F8F8))
        ),
        fillColor: const Color(0xffF8F8F8),
        filled: true,
        hintText: hint
      ),
    );
  }
}
