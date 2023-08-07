import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.onTap, required this.text});

  final Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10)
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
        child: Text(text, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),),
      ),
    );
  }
}
