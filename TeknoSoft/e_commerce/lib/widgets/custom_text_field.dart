import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
        this.type,
        required this.controller,
        this.iconButton,
        this.hint,
        this.icon,
        this.iconColor,
        required this.obscureText,
        required this.readOnly});

  final TextEditingController controller;
  Icon? icon;
  String? hint;
  IconButton? iconButton;
  bool obscureText;
  bool readOnly;
  Color? iconColor;
  TextInputType? type;

  @override
  Widget build(BuildContext context) {
    return TextField(
        keyboardType: type,
        readOnly: readOnly,
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(fillColor: Colors.grey,
          hintText: hint,
          hintStyle: GoogleFonts.openSans(fontSize: 18),
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          suffixIcon: icon,
          suffixIconColor: iconColor,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey)),
        ));
  }
}