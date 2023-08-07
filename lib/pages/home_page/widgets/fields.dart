import 'package:flutter/material.dart';

import 'field.dart';

class Fields extends StatelessWidget {
  const Fields({
    super.key,
    required this.changeFieldOnTap,
    required this.selectedField,
    required this.data,
  });

  final Function(int) changeFieldOnTap;
  final int selectedField;
  final Map<int, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Field(
                data: data,
                changeField: () => changeFieldOnTap(1),
                fieldIndex: 1,
                selectedFieldIndex: selectedField,
              ),
              Field(
                data: data,
                changeField: () => changeFieldOnTap(2),
                fieldIndex: 2,
                selectedFieldIndex: selectedField,
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Field(
                data: data,
                changeField: () => changeFieldOnTap(3),
                fieldIndex: 3,
                selectedFieldIndex: selectedField,
              ),
              Field(
                data: data,
                changeField: () => changeFieldOnTap(4),
                fieldIndex: 4,
                selectedFieldIndex: selectedField,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
