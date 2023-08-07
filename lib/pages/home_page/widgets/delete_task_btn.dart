import 'package:eisenhower_matrix/ui_style_constants.dart';
import 'package:flutter/material.dart';

class DeleteTaskBtn extends StatelessWidget {
  const DeleteTaskBtn({super.key, required this.onTap});

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: deleteTaskBtnColor,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.close_rounded,
          size: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}