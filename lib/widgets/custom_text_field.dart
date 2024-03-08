import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({this.hint, this.onChanged, this.obsecure = false});
  String? hint;
  bool? obsecure;
  Function(String value)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecure!,
      validator: (data) {
        if (data!.isEmpty) {
          return 'Field is Required';
        }
      },
      onChanged: onChanged,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.green,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.green,
            ),
            borderRadius: BorderRadius.circular(16)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
