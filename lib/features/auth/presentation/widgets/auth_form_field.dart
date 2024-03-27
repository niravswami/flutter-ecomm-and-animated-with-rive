// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AuthFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObscureText;

  const AuthFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isObscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      obscureText: isObscureText,
      validator: (value) => value!.isEmpty ? '$hintText is required!' : null,
    );
  }
}
