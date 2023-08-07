import 'package:eisenhower_matrix/ui_style_constants.dart';
import 'package:flutter/material.dart';
import 'package:eisenhower_matrix/pages/home_page/services.dart';
import 'field_text.dart';
import 'task_tile.dart';

class Field extends StatelessWidget {
  const Field({
    super.key,
    required this.changeField,
    required this.fieldIndex,
    required this.selectedFieldIndex,
    required this.data,
  });

  final Map<int, dynamic> data;
  final int fieldIndex;
  final int selectedFieldIndex;
  final Function()? changeField;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: changeField,
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: fieldIndex == selectedFieldIndex
                ? selectedFieldColor
                : unselectedFieldColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: !data[fieldIndex].isEmpty
              ? ListView.builder(
                  itemCount: data[fieldIndex].length,
                  itemBuilder: (context, index) {
                    return TaskTile(
                      text: data[fieldIndex][index].toString(),
                      fieldIndex: fieldIndex,
                      index: index,
                    );
                  },
                )
              : Stack(
                  alignment: Alignment.center,
                  children: [
                    FieldText(fieldIndex: fieldIndex),
                    Align(
                      alignment: getFieldAlign(fieldIndex),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4),
                          shape: BoxShape.circle,
                        ),
                        height: 40,
                        width: 40,
                        child: Center(
                          child: Text(
                            getFieldNumber(fieldIndex),
                            style: fieldTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
