import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextfield extends StatefulWidget {
  const MyTextfield(
      {super.key,
      required this.hintText,
      this.obsecureText = false,
      required this.controller,
      required this.icon});

  final icon;
  final String hintText;
  final TextEditingController controller;
  final bool obsecureText;

  @override
  State<MyTextfield> createState() => _MyTextfieldState();
}

class _MyTextfieldState extends State<MyTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.black38,
      obscureText: widget.obsecureText,
      controller: widget.controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue.shade600),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue.shade600),
        ),
        suffixIconColor: Colors.blue.shade600,
        suffixIcon: widget.icon,
        hintText: widget.hintText,
        hintStyle: GoogleFonts.poppins(color: Colors.black38, fontSize: 13),
      ),
    );
  }
}
