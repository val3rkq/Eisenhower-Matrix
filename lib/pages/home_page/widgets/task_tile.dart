import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:eisenhower_matrix/database/db.dart';
import 'package:eisenhower_matrix/generated/l10n.dart';
import 'package:eisenhower_matrix/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import 'delete_task_btn.dart';

class TaskTile extends StatelessWidget {
  TaskTile({
    super.key,
    required this.text,
    required this.index,
    required this.fieldIndex,
  });

  final String text;
  final int index;
  final int fieldIndex;

  DB db = DB();

  @override
  Widget build(BuildContext context) {
    db.getData();
    // get data from GetIt
    // 'delete'
    void Function(int, int) deleteTask = GetIt.I<Function(int, int)>();
    // 'edit'
    void Function(BuildContext, int, int) onEditTap =
        GetIt.I<Function(BuildContext, int, int)>();

    final List<ItemModel> items = [
      ItemModel(
        text: S.of(context).edit,
        icon: Icons.edit_rounded,
        index: 0,
      ),
      ItemModel(
        text: S.of(context).tag_as_done,
        icon: Icons.done_all_rounded,
        index: 1,
      ),
    ];

    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        value: null,
        onChanged: (newValue) {},
        onMenuStateChange: (change) {
          if (change) {
            HapticFeedback.mediumImpact();
          }
        },
        openWithLongPress: true,
        customButton: Container(
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
                  // run function
                  deleteTask(fieldIndex, index);
                },
              ),
            ],
          ),
        ),
        items: items.map((ItemModel value) {
          return DropdownMenuItem(
            value: value,
            child: Item(
              item: value,
              onTap: () {
                switch (value.index) {
                  case 0:
                    // edit task
                    Navigator.of(context).pop();

                    onEditTap(context, fieldIndex, index);
                  case 1:
                    // tag task as 'Done'
                    Navigator.of(context).pop();
                    db.doneTasks
                        .insert(0, [db.data[fieldIndex][index], fieldIndex]);
                    deleteTask(fieldIndex, index);
                }
              },
            ),
          );
        }).toList(),
        dropdownStyleData: const DropdownStyleData(
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: Colors.transparent,
            boxShadow: [],
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
          // customHeights: [
          //   50,
          //   // 65,
          // ],
          padding: const EdgeInsets.fromLTRB(5, 2, 5, 0),
        ),
      ),
    );
  }
}

class ItemModel {
  const ItemModel({
    required this.index,
    required this.text,
    required this.icon,
  });

  final int index;
  final String text;
  final IconData icon;
}

class Item extends StatelessWidget {
  const Item({
    super.key,
    required this.item,
    required this.onTap,
  });

  final ItemModel item;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.red,
          boxShadow: const [
            BoxShadow(blurRadius: 15, spreadRadius: 0.1, color: Colors.white)
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(item.icon, color: Colors.white, size: 22),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Text(
                item.text,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
