import 'package:flutter/material.dart';
import 'package:eisenhower_matrix/pages/home_page/services.dart';
import 'package:eisenhower_matrix/ui_constants.dart';

class FieldText extends StatelessWidget {
  const FieldText({
    super.key,
    required this.fieldIndex,
  });

  final int fieldIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          getFieldText(context, fieldIndex)[0].toUpperCase(),
          style: fieldTextStyle,
          textAlign: TextAlign.center,
        ),
        Text(
          getFieldText(context, fieldIndex)[1].toUpperCase(),
          style: fieldTextStyle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
