import 'package:flutter/material.dart';

class AddTaskBtn extends StatelessWidget {
  const AddTaskBtn({super.key, required this.onTap});

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 60,
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.add_rounded,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
