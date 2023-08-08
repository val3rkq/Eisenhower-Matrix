import 'package:eisenhower_matrix/generated/l10n.dart';
import 'package:eisenhower_matrix/pages/home_page/widgets/my_btn.dart';
import 'package:eisenhower_matrix/ui_constants.dart';
import 'package:flutter/material.dart';

class AcceptDialog extends StatelessWidget {
  const AcceptDialog({super.key, required this.onTap});

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(20),
        width: 120,
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              S.of(context).accept,
              style: defaultTextStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyButton(
                  text: S.of(context).no,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                MyButton(
                  text: S.of(context).yes,
                  onTap: onTap,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
