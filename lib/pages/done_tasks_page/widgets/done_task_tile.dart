import 'package:eisenhower_matrix/database/db.dart';
import 'package:flutter/material.dart';

class DoneTaskTile extends StatelessWidget {
  const DoneTaskTile({
    super.key,
    required this.index,
    required this.db,
    required this.onDeleteTap,
    required this.onReturnTap,
  });

  final int index;
  final DB db;
  final Function()? onDeleteTap;
  final Function()? onReturnTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(db.doneTasks[index][0]),
        trailing: SizedBox(
          width: 60,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: onReturnTap,
                child: const Icon(
                  Icons.update_rounded,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: onDeleteTap,
                child: const Icon(
                  Icons.delete_rounded,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
