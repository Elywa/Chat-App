import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({this.ontTap, required this.text});
  final String text;
  VoidCallback? ontTap; 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
