import 'package:eisenhower_matrix/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'delete_task_btn.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.text,
    required this.index,
    required this.fieldIndex,
  });

  final String text;
  final int index;
  final int fieldIndex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // show dialog for editing
        void Function(BuildContext, int, int) onEditTap = GetIt.I<Function(BuildContext, int, int)>();
        onEditTap(context, fieldIndex, index);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(7),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                text,
                style: taskTextStyle,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            DeleteTaskBtn(
              onTap: () {
                // get function from GetIt
                void Function(int, int) deleteTask =
                    GetIt.I<Function(int, int)>();
                // run function
                deleteTask(fieldIndex, index);
              },
            ),
          ],
        ),
      ),
    );
  }
}
