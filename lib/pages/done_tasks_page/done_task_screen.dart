import 'package:eisenhower_matrix/generated/l10n.dart';
import 'package:eisenhower_matrix/ui_style_constants.dart';
import 'package:flutter/material.dart';

class DoneTaskPage extends StatefulWidget {
  const DoneTaskPage({super.key});

  @override
  State<DoneTaskPage> createState() => _DoneTaskPageState();
}

class _DoneTaskPageState extends State<DoneTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: true,
        title: Text(
          S.of(context).done_tasks,
          style: appBarWhiteTextStyle,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: mainColor,
        child: const Icon(Icons.delete_forever_rounded),
      ),
    );
  }
}
