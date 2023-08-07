import 'package:eisenhower_matrix/generated/l10n.dart';
import 'package:eisenhower_matrix/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:radio_grouped_buttons/custom_buttons/custom_radio_buttons_group.dart';

class TaskStatusBox extends StatelessWidget {
  const TaskStatusBox({
    super.key,
    required this.checkUrgency,
    required this.text,
    required this.onBtnTap,
    required this.isUrgent,
    required this.isImportant,
  });

  final bool checkUrgency;
  final bool isUrgent;
  final bool isImportant;
  final Function(int) onBtnTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    final List<String> list = [S.of(context).no, S.of(context).yes];
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 90,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              S.of(context).is_this_task(text),
              style: mediumTextStyle,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Center(
            child: CustomRadioButton(
              buttonLables: list,
              buttonValues: list,
              radioButtonValue: (value, index) => onBtnTap(index),
              horizontal: true,
              enableShape: false,
              elevation: 0,
              buttonSpace: 10,
              buttonColor: Colors.grey.shade200,
              selectedColor: Colors.red,
              initialSelection: checkUrgency
                  ? isUrgent
                      ? 1
                      : 0
                  : isImportant
                      ? 1
                      : 0,
            ),
          ),
        ],
      ),
    );
  }
}
